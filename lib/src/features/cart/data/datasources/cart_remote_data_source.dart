import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/errors/exception.dart';
import '../../domain/entities/core_product.dart';
import '../models/core_cart_item_model.dart';
import '../models/core_cart_model.dart';
import '../models/core_cart_params_model.dart';
import '../models/core_product_model.dart';
import '../models/core_seller_model.dart';

abstract class CartRemoteDataSource {
  const CartRemoteDataSource();

  Future<List<CoreProductModel>> getAllProduct();

  Future<List<CoreSellerModel>> getAllSeller();

  Future<Position> getCurrentPosition();

  Future<List<CoreProduct>> getAllProductBySeller(String sellerId);

  Future<CoreCartModel> postItemToCart(CoreCartParamsModel params);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final FirebaseFirestore _firestore;

  const CartRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<CoreProductModel>> getAllProduct() async {
    try {
      final snapshot = await _firestore.collection('products').get();

      final result = snapshot.docs.map((product) {
        final productMap = product.data();
        productMap['id'] = product.id;
        return CoreProductModel.fromMap(productMap);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CoreSellerModel>> getAllSeller() async {
    try {
      final snapshot = await _firestore.collection('sellers').get();

      final result = snapshot.docs
          .map((seller) => CoreSellerModel.fromMap(seller.data()))
          .toList();

      return result;
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<Position> getCurrentPosition() async {
    try {
      // checking user permission
      bool serviceEnabled;
      LocationPermission permission;

      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw const LocalException(message: "Location service is disabled");
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied ||
            permission == LocationPermission.deniedForever) {
          throw const LocalException(message: "Location permission denied");
        }
      }

      // If Permission Allowed
      final currentPosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
      ));

      return currentPosition;
    } on LocalException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw LocalException(message: e.toString());
    }
  }

  @override
  Future<List<CoreProduct>> getAllProductBySeller(String sellerId) async {
    try {
      final query = await _firestore
          .collection('sellers')
          .where('userId', isEqualTo: sellerId)
          .limit(1)
          .get();

      final fixSellerId = query.docs.first.id;

      final snapshot = await _firestore
          .collection('products')
          .where(
            'sellerId',
            isEqualTo: fixSellerId,
          )
          .get();

      final result = snapshot.docs.map((product) {
        final productMap = product.data();
        productMap['id'] = product.id;
        return CoreProductModel.fromMap(productMap);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<CoreCartModel> postItemToCart(CoreCartParamsModel params) async {
    try {
      final query = await _firestore
          .collection('products')
          .doc(params.item.productId)
          .get();

      final sellerId = query.id;

      final doc = await _firestore
          .collection('carts')
          .where('sellerId', isEqualTo: sellerId)
          .where('userId', isEqualTo: params.userId)
          .limit(1)
          .get();

      if (doc.docs.isEmpty) {
        await _firestore.collection('carts').doc().set({
          'items': [CoreCartItemModel.fromEntity(params.item).toMap()],
          'sellerId': sellerId,
          'userId': params.userId,
          'updatedAt': DateTime.now(),
        });
      } else {
        final data = doc.docs.first;
        final List<dynamic> items = data['items'] ?? [];

        final List<Map<String, dynamic>> updatedItems =
            List<Map<String, dynamic>>.from(items);

        // Cek apakah item sudah ada
        final index = updatedItems
            .indexWhere((item) => item['productId'] == params.item.productId);

        // Jika sudah ada → update qty
        final currentQty = updatedItems[index]['quantity'] ?? 0;
        final currentPrice = updatedItems[index]['price'] ?? 0;
        final updatedQty = currentQty + 1;
        final updatedTotalPrice = currentPrice * updatedQty;

        updatedItems[index]['quantity'] = updatedQty;
        updatedItems[index]['subTotal'] = updatedTotalPrice;

        // Update Firestore
        await _firestore.collection('carts').doc(data.id).update({
          'items': updatedItems,
          'updatedAt': DateTime.now(),
        });
      }

      final updatedQuery = await _firestore
          .collection('carts')
          .where('sellerId', isEqualTo: sellerId)
          .where('userId', isEqualTo: params.userId)
          .limit(1)
          .get();

      final updatedNewItems = updatedQuery.docs.first.data();
      final newItems = (updatedNewItems['items'] as List)
          .map((newItem) => CoreCartItemModel.fromMap(newItem))
          .toList();

      final totalPrice = newItems.fold<double>(
        0,
        (sums, item) => sums + (item.price * item.quantity),
      );

      // Tambahkan field baru ke map
      updatedNewItems['totalAmount'] = totalPrice;

      return CoreCartModel.fromMap(updatedNewItems);
    } on FirebaseException catch (e) {
      throw ServerException(
        message: "Failed with error '${e.code}': ${e.message}",
        statusCode: 505,
      );
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}

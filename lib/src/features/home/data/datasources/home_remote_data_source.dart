import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/res/media_res.dart';
import '../../../cart/data/models/core_product_model.dart';

abstract class HomeRemoteDataSource {
  const HomeRemoteDataSource();

  Future<List<String>> getNews();

  Future<List<CoreProductModel>> getRecommendProduct();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final FirebaseFirestore _firestore;

  const HomeRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<String>> getNews() async {
    try {
      final dummyNews = List.generate(6, (_) => MediaRes.promoDummyImages);

      return dummyNews;
    } on ServerException {
      rethrow;
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<CoreProductModel>> getRecommendProduct() async {
    try {
      final snapshot = await _firestore
          .collection('products')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .limit(10)
          .get();

      final List<CoreProductModel> products = [];

      for (final doc in snapshot.docs) {
        final productData = doc.data();
        final sellerId = productData['sellerId'];

        final sellerSnapshot = await _firestore.collection('sellers').doc(sellerId).get();
        final sellerData = sellerSnapshot.data();

        if (sellerData != null) {
          productData['seller'] = sellerData;

          final product = CoreProductModel.fromMap(productData);
          products.add(product);
        }
      }

      return products;
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

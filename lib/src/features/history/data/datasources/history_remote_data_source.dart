import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/errors/exception.dart';
import '../model/core_order_model.dart';

abstract class HistoryRemoteDataSource {
  const HistoryRemoteDataSource();

  Future<List<CoreOrderModel>> getUserOrders(String userId);
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  final FirebaseFirestore _firestore;

  const HistoryRemoteDataSourceImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<List<CoreOrderModel>> getUserOrders(String userId) async {
    try {
      final snapshot = await _firestore
          .collection('orders')
          .where('buyerId', isEqualTo: userId)
          .limit(1)
          .get();

      final firstSnap = snapshot.docs.first.data();

      final docSeller = await _firestore
          .collection('sellers')
          .doc('${firstSnap['sellerId']}')
          .get();
      final sellerMap = docSeller.data();
      final sellerName = sellerMap!['businessName'] as String;

      final result = snapshot.docs.map((order) {
        final orderMap = order.data();
        orderMap['id'] = order.id;
        orderMap['sellerName'] = sellerName;
        return CoreOrderModel.fromMap(orderMap);
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
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/typedef.dart';
import '../../../cart/data/models/core_cart_item_model.dart';
import '../../domain/entities/core_order.dart';

class CoreOrderModel extends CoreOrder {
  const CoreOrderModel({
    required super.orderNumber,
    required super.orderId,
    required super.buyerId,
    required super.createdAt,
    required super.updatedAt,
    required super.isArrived,
    required super.isDelivered,
    required super.sellerId,
    required super.totalAmount,
    required super.items,
    required super.status,
    required super.address,
    required super.sellerName,
  });

  CoreOrderModel.fromMap(DataMap map)
      : super(
          orderNumber: map['orderNumber'] as String,
          orderId: map['id'] as String,
          buyerId: map['buyerId'] as String,
          address: map['address'] as String,
          isArrived: map['is_arrived'] as bool,
          isDelivered: map['is_delivered'] as bool,
          sellerId: map['sellerId'] as String,
          totalAmount: map['totalAmount'] as num,
          updatedAt: (map['updatedAt'] as Timestamp).toDate().toString(),
          createdAt: (map['createdAt'] as Timestamp).toDate().toString(),
          status: map['paymentStatus'] as String,
          items: (map['items'] as List)
              .map((item) => CoreCartItemModel.fromMap(item))
              .toList(),
          sellerName: map['sellerName'] as String,
        );

  CoreOrderModel.fromEntity(CoreOrder entity)
      : super(
          orderNumber: entity.orderNumber,
          orderId: entity.orderId,
          buyerId: entity.buyerId,
          address: entity.address,
          isDelivered: entity.isDelivered,
          isArrived: entity.isArrived,
          sellerId: entity.sellerId,
          totalAmount: entity.totalAmount,
          updatedAt: entity.updatedAt,
          createdAt: entity.createdAt,
          status: entity.status,
          items: entity.items,
          sellerName: entity.sellerName,
        );
}

import 'package:equatable/equatable.dart';

import '../../../cart/domain/entities/core_cart_item.dart';

class CoreOrder extends Equatable {
  final String orderNumber;
  final String orderId;
  final String buyerId;
  final String createdAt;
  final String updatedAt;
  final bool isArrived;
  final bool isDelivered;
  final String sellerId;
  final num totalAmount;
  final List<CoreCartItem> items;
  final String status;
  final String address;
  final String sellerName;

  const CoreOrder({
    required this.orderNumber,
    required this.orderId,
    required this.buyerId,
    required this.createdAt,
    required this.updatedAt,
    required this.isArrived,
    required this.isDelivered,
    required this.sellerId,
    required this.totalAmount,
    required this.items,
    required this.status,
    required this.address,
    required this.sellerName,
  });

  @override
  List<Object?> get props => [
        orderNumber,
        orderId,
        buyerId,
        createdAt,
        updatedAt,
        isArrived,
        isDelivered,
        sellerId,
        totalAmount,
        items,
        status,
        address,
        sellerName,
      ];
}

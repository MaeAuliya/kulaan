import 'package:equatable/equatable.dart';

import 'core_cart_item.dart';

class PostOrderParams extends Equatable {
  final String buyerId;
  final String sellerId;
  final num totalAmount;
  final String address;
  final List<CoreCartItem> items;

  const PostOrderParams({
    required this.buyerId,
    required this.sellerId,
    required this.totalAmount,
    required this.address,
    required this.items,
  });

  @override
  List<Object?> get props => [
        buyerId,
        sellerId,
        totalAmount,
        address,
        items,
      ];
}

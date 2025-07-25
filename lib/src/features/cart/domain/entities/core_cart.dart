import 'package:equatable/equatable.dart';

import 'core_cart_item.dart';

class CoreCart extends Equatable {
  final String sellerId;
  final num totalAmount;
  final String userId;
  final List<CoreCartItem> items;

  const CoreCart({
    required this.sellerId,
    required this.totalAmount,
    required this.userId,
    required this.items,
  });

  @override
  List<Object?> get props => [
        sellerId,
        totalAmount,
        userId,
        items,
      ];
}

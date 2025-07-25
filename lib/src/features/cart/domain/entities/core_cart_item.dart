import 'package:equatable/equatable.dart';

class CoreCartItem extends Equatable {
  final num price;
  final String productId;
  final String productName;
  final int quantity;
  final num subTotal;

  const CoreCartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.subTotal,
  });

  @override
  List<Object?> get props => [
        productId,
        productName,
        price,
        quantity,
        subTotal,
      ];
}

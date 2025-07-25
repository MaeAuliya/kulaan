import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_cart_item.dart';

class CoreCartItemModel extends CoreCartItem {
  const CoreCartItemModel({
    required super.productId,
    required super.productName,
    required super.price,
    required super.quantity,
    required super.subTotal,
  });

  CoreCartItemModel.fromMap(DataMap map)
      : super(
          price: map['price'] as num,
          productId: map['productId'] as String,
          productName: map['productName'] as String,
          quantity: map['quantity'] as int,
          subTotal: map['subTotal'] as num,
        );

  CoreCartItemModel.fromEntity(CoreCartItem entity)
      : super(
          price: entity.price,
          productId: entity.productId,
          productName: entity.productName,
          quantity: entity.quantity,
          subTotal: entity.subTotal,
        );

  DataMap toMap() => {
        'price': price,
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'subTotal': subTotal,
      };
}

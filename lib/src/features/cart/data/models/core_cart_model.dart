import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_cart.dart';
import 'core_cart_item_model.dart';

class CoreCartModel extends CoreCart {
  const CoreCartModel({
    required super.sellerId,
    required super.totalAmount,
    required super.userId,
    required super.items,
  });

  CoreCartModel.fromMap(DataMap map)
      : super(
          sellerId: map['sellerId'] as String,
          totalAmount: map['totalAmount'] as num? ?? 0,
          userId: map['userId'] as String,
          items: (map['items'] as List)
              .map((item) => CoreCartItemModel.fromMap(item))
              .toList(),
        );
}

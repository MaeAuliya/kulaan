import '../../../../core/utils/typedef.dart';
import '../../domain/entities/post_order_params.dart';
import 'core_cart_item_model.dart';

class PostOrderParamsModel extends PostOrderParams {
  const PostOrderParamsModel({
    required super.buyerId,
    required super.sellerId,
    required super.totalAmount,
    required super.items,
    required super.address,
  });

  PostOrderParamsModel.fromEntity(PostOrderParams entity)
      : super(
          buyerId: entity.buyerId,
          sellerId: entity.sellerId,
          totalAmount: entity.totalAmount,
          items: entity.items,
          address: entity.address,
        );

  DataMap toMap() => {
        'buyerId': buyerId,
        'createdAt': DateTime.now(),
        'address': address,
        'is_arrived': false,
        'is_delivered': false,
        'items':
            items.map((item) => CoreCartItemModel.fromEntity(item).toMap()),
        'orderNumber': 'KUL-${DateTime.now()}',
        'paymentStatus': 'pending',
        'sellerId': sellerId,
        'totalAmount': totalAmount,
        'updatedAt': DateTime.now(),
      };
}

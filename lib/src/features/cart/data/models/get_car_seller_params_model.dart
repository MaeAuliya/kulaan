import '../../domain/entities/get_cart_seller_params.dart';

class GetCarSellerParamsModel extends GetCartSellerParams {
  const GetCarSellerParamsModel({
    required super.userId,
    required super.sellerId,
  });

  GetCarSellerParamsModel.fromEntity(GetCartSellerParams entity)
      : super(
          userId: entity.userId,
          sellerId: entity.sellerId,
        );
}

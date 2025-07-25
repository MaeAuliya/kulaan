import '../../domain/entities/core_cart_params.dart';

class CoreCartParamsModel extends CoreCartParams {
  const CoreCartParamsModel({
    required super.userId,
    required super.item,
  });

  CoreCartParamsModel.fromEntity(CoreCartParams entity)
      : super(
          userId: entity.userId,
          item: entity.item,
        );
}

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_seller_operating_time.dart';

class CoreSellerOperatingTimeModel extends CoreSellerOperatingTime {
  const CoreSellerOperatingTimeModel({
    required super.close,
    required super.days,
    required super.open,
  });

  CoreSellerOperatingTimeModel.fromMap(DataMap map)
      : super(
          close: map['close'] as String,
          days: [map['days'] as String],
          open: map['open'] as String,
        );
}

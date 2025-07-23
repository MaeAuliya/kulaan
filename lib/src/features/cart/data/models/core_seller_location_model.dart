import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_seller_location.dart';

class CoreSellerLocationModel extends CoreSellerLocation {
  const CoreSellerLocationModel({
    required super.address,
    required super.city,
    required super.district,
    required super.latitude,
    required super.longitude,
  });

  CoreSellerLocationModel.fromMap(DataMap map)
      : super(
          address: map['address'] as String,
          city: map['city'] as String,
          district: map['district'] as String,
          latitude: num.tryParse(map['latitude'] as String? ?? '0') as double? ?? 0,
          longitude: num.tryParse(map['longitude'] as String? ?? '0') as double? ?? 0,
        );
}

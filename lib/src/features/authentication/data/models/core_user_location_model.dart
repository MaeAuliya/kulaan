import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_user_location.dart';

class CoreUserLocationModel extends CoreUserLocation {
  const CoreUserLocationModel({
    required super.address,
    required super.city,
    required super.district,
    required super.latitude,
    required super.longitude,
  });

  const CoreUserLocationModel.empty()
      : super(
          address: '',
          city: '',
          district: '',
          latitude: 0,
          longitude: 0,
        );

  CoreUserLocationModel.fromMap(DataMap map)
      : super(
          address: map['address'] as String,
          city: map['city'] as String,
          district: map['district'] as String,
          latitude: (map['latitude'] as num).toDouble(),
          longitude: (map['longitude'] as num).toDouble(),
        );
}

import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_seller.dart';
import 'core_seller_location_model.dart';
import 'core_seller_operating_time_model.dart';

class CoreSellerModel extends CoreSeller {
  const CoreSellerModel({
    required super.userId,
    required super.businessName,
    required super.businessType,
    required super.description,
    required super.location,
    required super.operatingTime,
  });

  CoreSellerModel.fromMap(DataMap map)
      : super(
          userId: map['userId'] as String,
          businessName: map['businessName'] as String,
          businessType: map['businessType'] as String,
          description: map['description'] as String,
          location: CoreSellerLocationModel.fromMap(map['location'] as DataMap),
          operatingTime: CoreSellerOperatingTimeModel.fromMap(map['operatingHours'] as DataMap),
        );

  CoreSellerModel.fromEntity(CoreSeller entity)
      : super(
          userId: entity.userId,
          businessName: entity.businessName,
          businessType: entity.businessType,
          description: entity.description,
          location: entity.location,
          operatingTime: entity.operatingTime,
        );
}

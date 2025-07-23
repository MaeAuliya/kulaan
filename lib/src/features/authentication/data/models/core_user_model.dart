import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_user.dart';
import 'core_user_location_model.dart';

class CoreUserModel extends CoreUser {
  const CoreUserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.isActive,
    required super.phoneNumber,
    required super.role,
    required super.location,
  });

  const CoreUserModel.empty()
      : super(
          id: '',
          email: '',
          name: '',
          isActive: false,
          phoneNumber: '',
          role: '',
          location: const CoreUserLocationModel.empty(),
        );

  CoreUserModel.fromEntity(CoreUser entity)
      : super(
          id: entity.id,
          email: entity.email,
          name: entity.name,
          isActive: entity.isActive,
          phoneNumber: entity.phoneNumber,
          role: entity.role,
          location: entity.location,
        );

  CoreUserModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          email: map['email'] as String,
          name: map['displayName'] as String,
          isActive: map['isActive'] as bool,
          phoneNumber: map['phoneNumber'] as String,
          role: map['role'] as String,
          location: CoreUserLocationModel.fromMap(map['location'] as DataMap),
        );
}

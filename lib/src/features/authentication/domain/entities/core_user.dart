import 'package:equatable/equatable.dart';

import 'core_user_location.dart';

class CoreUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final bool isActive;
  final String phoneNumber;
  final String role;
  final CoreUserLocation location;

  const CoreUser({
    required this.id,
    required this.email,
    required this.name,
    required this.isActive,
    required this.phoneNumber,
    required this.role,
    required this.location,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        isActive,
        phoneNumber,
        role,
        location,
      ];
}

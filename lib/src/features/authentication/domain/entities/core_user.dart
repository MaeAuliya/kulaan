import 'package:equatable/equatable.dart';

class CoreUser extends Equatable {
  final String id;
  final String email;
  final String name;
  final bool isActive;
  final String phoneNumber;
  final String role;

  const CoreUser({
    required this.id,
    required this.email,
    required this.name,
    required this.isActive,
    required this.phoneNumber,
    required this.role,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        isActive,
        phoneNumber,
        role,
      ];
}

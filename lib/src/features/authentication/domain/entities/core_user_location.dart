import 'package:equatable/equatable.dart';

class CoreUserLocation extends Equatable {
  final String address;
  final String city;
  final String district;
  final double latitude;
  final double longitude;

  const CoreUserLocation({
    required this.address,
    required this.city,
    required this.district,
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [
        address,
        city,
        district,
        latitude,
        longitude,
      ];
}

import 'package:equatable/equatable.dart';

import 'core_seller_location.dart';
import 'core_seller_operating_time.dart';

class CoreSeller extends Equatable {
  final String userId;
  final String businessName;
  final String businessType;
  final String description;
  final CoreSellerLocation location;
  final CoreSellerOperatingTime operatingTime;

  const CoreSeller({
    required this.userId,
    required this.businessName,
    required this.businessType,
    required this.description,
    required this.location,
    required this.operatingTime,
  });

  @override
  List<Object?> get props => [
        userId,
        businessName,
        businessType,
        description,
        location,
        operatingTime,
      ];
}

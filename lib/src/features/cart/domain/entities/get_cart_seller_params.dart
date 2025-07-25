import 'package:equatable/equatable.dart';

class GetCartSellerParams extends Equatable {
  final String userId;
  final String sellerId;

  const GetCartSellerParams({
    required this.userId,
    required this.sellerId,
  });

  @override
  List<Object?> get props => [
        userId,
        sellerId,
      ];
}

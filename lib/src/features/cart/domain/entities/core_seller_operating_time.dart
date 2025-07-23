import 'package:equatable/equatable.dart';

class CoreSellerOperatingTime extends Equatable {
  final String close;
  final List<String> days;
  final String open;

  const CoreSellerOperatingTime({
    required this.close,
    required this.days,
    required this.open,
  });

  @override
  List<Object?> get props => [
        close,
        days,
        open,
      ];
}

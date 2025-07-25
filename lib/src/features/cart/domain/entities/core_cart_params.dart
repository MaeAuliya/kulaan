import 'package:equatable/equatable.dart';

import 'core_cart_item.dart';

class CoreCartParams extends Equatable {
  final String userId;
  final CoreCartItem item;

  const CoreCartParams({
    required this.userId,
    required this.item,
  });

  @override
  List<Object?> get props => [
        userId,
        item,
      ];
}

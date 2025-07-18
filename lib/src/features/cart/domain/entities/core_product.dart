import 'package:equatable/equatable.dart';

class CoreProduct extends Equatable {
  final String name;
  final String category;
  final String description;
  final bool isAvailable;
  final int minOrder;
  final int price;
  final String sellerId;
  final int stock;
  final String subCategory;
  final String unit;

  const CoreProduct({
    required this.name,
    required this.category,
    required this.description,
    required this.isAvailable,
    required this.minOrder,
    required this.price,
    required this.sellerId,
    required this.stock,
    required this.subCategory,
    required this.unit,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        description,
        isAvailable,
        minOrder,
        price,
        sellerId,
        stock,
        subCategory,
        unit,
      ];
}

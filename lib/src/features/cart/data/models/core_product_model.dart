import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_product.dart';

class CoreProductModel extends CoreProduct {
  const CoreProductModel({
    required super.name,
    required super.category,
    required super.description,
    required super.isAvailable,
    required super.minOrder,
    required super.price,
    required super.sellerId,
    required super.stock,
    required super.subCategory,
    required super.unit,
  });

  CoreProductModel.fromMap(DataMap map)
      : super(
          name: map['Name'] as String,
          category: map['category'] as String,
          description: map['description'] as String,
          isAvailable: map['isAvailable'] as bool,
          minOrder: map['minOrder'] as int,
          price: map['price'] as int,
          sellerId: map['sellerId'] as String,
          stock: map['stock'] as int,
          subCategory: map['subcategory'] as String,
          unit: map['unit'] as String,
        );
}

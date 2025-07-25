import '../../../../core/utils/typedef.dart';
import '../../domain/entities/core_product.dart';
import 'core_seller_model.dart';

class CoreProductModel extends CoreProduct {
  const CoreProductModel({
    required super.id,
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
    super.seller,
  });

  CoreProductModel.fromMap(DataMap map)
      : super(
          id: map['id'] as String,
          name: map['Name'] as String,
          category: map['category'] as String,
          description: map['description'] as String,
          isAvailable: bool.parse(map['isAvailable'] as String? ?? 'false'),
          minOrder: map['minOrder'] as int,
          price: map['price'] as int,
          sellerId: map['sellerId'] as String,
          stock: map['stock'] as int,
          subCategory: map['subcategory'] as String,
          unit: map['unit'] as String,
          seller: (map['seller'] == null)
              ? null
              : CoreSellerModel.fromMap(map['seller'] as DataMap),
        );

  CoreProductModel.fromEntity(CoreProduct entity)
      : super(
          id: entity.id,
          name: entity.name,
          category: entity.category,
          description: entity.description,
          isAvailable: entity.isAvailable,
          minOrder: entity.minOrder,
          price: entity.price,
          sellerId: entity.sellerId,
          stock: entity.stock,
          subCategory: entity.subCategory,
          unit: entity.unit,
          seller: entity.seller,
        );
}

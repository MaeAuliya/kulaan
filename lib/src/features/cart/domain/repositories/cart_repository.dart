import '../../../../core/utils/typedef.dart';
import '../entities/core_product.dart';

abstract class CartRepository {
  const CartRepository();

  ResultFuture<List<CoreProduct>> getAllProduct();
}

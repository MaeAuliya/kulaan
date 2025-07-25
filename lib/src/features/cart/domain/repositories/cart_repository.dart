import 'package:geolocator/geolocator.dart';

import '../../../../core/utils/typedef.dart';
import '../entities/core_cart.dart';
import '../entities/core_cart_params.dart';
import '../entities/core_product.dart';
import '../entities/core_seller.dart';
import '../entities/get_cart_seller_params.dart';
import '../entities/post_order_params.dart';

abstract class CartRepository {
  const CartRepository();

  ResultFuture<List<CoreProduct>> getAllProduct();

  ResultFuture<List<CoreSeller>> getAllSeller();

  ResultFuture<Position> getCurrentPosition();

  ResultFuture<List<CoreProduct>> getAllProductBySeller(String sellerId);

  ResultFuture<CoreCart> postItemToCart(CoreCartParams params);

  ResultFuture<CoreCart?> getUserCartBySeller(GetCartSellerParams params);

  ResultVoid createOrder(PostOrderParams params);
}

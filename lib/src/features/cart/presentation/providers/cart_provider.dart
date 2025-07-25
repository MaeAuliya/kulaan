import 'package:flutter/cupertino.dart';

import '../../data/models/core_cart_model.dart';
import '../../domain/entities/core_cart.dart';
import '../../domain/entities/core_product.dart';

class CartProvider extends ChangeNotifier {
  void initScreen() {
    _sellerProducts = null;
    _sellerCart = CoreCartModel.empty();
  }

  List<CoreProduct>? _sellerProducts;

  List<CoreProduct>? get sellerProduct => _sellerProducts;

  void initSellerProducts(List<CoreProduct> sellerProduct) {
    _sellerProducts = sellerProduct;
    notifyListeners();
  }

  CoreCart _sellerCart = CoreCartModel.empty();

  CoreCart get sellerCart => _sellerCart;

  void initSellerCart(CoreCart cart) {
    _sellerCart = cart;
    notifyListeners();
  }
}

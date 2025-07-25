import 'package:flutter/cupertino.dart';

import '../../domain/entities/core_product.dart';

class CartProvider extends ChangeNotifier {
  List<CoreProduct>? _sellerProducts;
  List<CoreProduct>? get sellerProduct => _sellerProducts;

  void initSellerProducts(List<CoreProduct> sellerProduct) {
    _sellerProducts = sellerProduct;
    notifyListeners();
  }
}

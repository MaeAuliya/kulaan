import 'package:flutter/cupertino.dart';

import '../../domain/entities/core_order.dart';

class OrderProvider extends ChangeNotifier {
  List<CoreOrder>? _userOrders;

  List<CoreOrder>? get userOrders => _userOrders;

  void initOrders(List<CoreOrder> orders) {
    _userOrders = orders;
    notifyListeners();
  }
}

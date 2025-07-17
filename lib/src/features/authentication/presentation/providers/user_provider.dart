import 'package:flutter/cupertino.dart';

import '../../domain/entities/core_user.dart';

class UserProvider extends ChangeNotifier {
  CoreUser? _currentUser;
  CoreUser? get currentUser => _currentUser;

  void updateUser(CoreUser user) {
    _currentUser = user;
    notifyListeners();
  }
}

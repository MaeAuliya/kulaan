import 'package:flutter/cupertino.dart';

import '../../../../core/utils/core_utils.dart';

class AuthenticationProvider extends ChangeNotifier {
  void initSignIn() {
    _isPasswordShow = false;
    _emailErrorMessage = null;
    _passwordErrorMessage = null;
  }

  bool _isPasswordShow = false;

  bool get isPasswordShow => _isPasswordShow;

  void showPassword() {
    _isPasswordShow = !_isPasswordShow;
    notifyListeners();
  }

  String? _emailErrorMessage;

  String? get emailErrorMessage => _emailErrorMessage;

  String? _passwordErrorMessage;

  String? get passwordErrorMessage => _passwordErrorMessage;

  void setErrorMessage() {
    _emailErrorMessage = '* Invalid Email';
    _passwordErrorMessage = '* Invalid Password';
    notifyListeners();
  }

  void validateSignIn({
    required String email,
    required String password,
  }) {
    _emailErrorMessage = CoreUtils.validateEmail(email);
    _passwordErrorMessage = CoreUtils.validatePassword(password);
    notifyListeners();
  }

  bool get isValidToSignIn => _emailErrorMessage == null && _passwordErrorMessage == null;
}

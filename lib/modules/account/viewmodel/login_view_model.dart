import 'package:flutter/cupertino.dart';
import 'package:flutterdemo/modules/account/model/account_model.dart';

class LoginViewModel extends ChangeNotifier {
  late AccountModel model;

  LoginViewModel() {
    model = AccountModel();
  }

  ///允许登录
  bool _canLogin = false;

  bool get canLogin => _canLogin;

  set canLogin(bool val) {
    _canLogin = val;
    notifyListeners();
  }

  ///密码模式
  bool _obscureText = true;

  bool get obscureText => _obscureText;

  set obscureText(bool val) {
    _obscureText = val;
    notifyListeners();
  }
}
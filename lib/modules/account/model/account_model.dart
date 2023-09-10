import 'dart:io';

import 'package:flutterdemo/modules/account/model/user_entity.dart';
import 'package:flutterdemo/core/net/http_result.dart';

class AccountModel {
  //登录
  String loginApi = "user/login";

  //注册
  String registerApi = "user/register";

  //退出登录
  String logoutApi = "user/logout/json";

  //登录
  Future<HttpResult<UserEntity>> login(
      String account, String psw, HttpCanceler? canceler) async {
    ///参数
    Map<String, dynamic>? params = {
      "username": account, "password": psw
    };

    ///结果
    Map<String, dynamic> value = await HttpRequest.post(loginApi, params: params, canceler: canceler);

    return HttpResult<UserEntity>().convert(value);
  }
}
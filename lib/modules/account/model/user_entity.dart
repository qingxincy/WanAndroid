import 'dart:convert';
import 'package:flutterdemo/helper/image_helper.dart';

class UserEntity {
  @JSONField(name: "id")
  int? uid = 0;
  String? nickname = "";

  //积分
  int? coinCount = 0;
  String? icon = "";

  UserEntity();

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    //手动添加头像
    if (!json.containsKey("icon")) {
      json["icon"] = ImageHelper.randomUrl();
    }
    String value = json["icon"];
    if (value.isEmpty) {
      json["icon"] = ImageHelper.randomUrl();
    }
    return $UserEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => $UserEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
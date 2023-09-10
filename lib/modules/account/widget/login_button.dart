import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//登录按钮
class LoginButton extends StatefulWidget {
  final String text;
  final bool canSubmit;
  final VoidCallback onPressed;

  const LoginButton(
      {Key? key,
      required this.text,
      required this.canSubmit,
      required this.onPressed})
      : super(key: key);

  @override
  State createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.canSubmit ? widget.onPressed : null,
      style: ButtonStyle(
          //设置背景
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.grey[400];
            }
            // 设置默认颜色
            return Theme.of(context).primaryColor;
          }),

          //设置字体
          foregroundColor:
              MaterialStateProperty.resolveWith((states) => Colors.white),
          //设置形状
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
          //设置宽高
          minimumSize:
              MaterialStateProperty.all(const Size(double.infinity, 50.0))),
      child: Text(widget.text),
    );
  }
}

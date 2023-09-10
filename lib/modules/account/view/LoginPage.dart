import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/modules/account/viewmodel/login_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage>
    with Lifecycle, LifecycleObserver {
  late BuildContext _buildContext;
  late HttpCanceler httpCanceler;

  @override
  void initState() {
    super.initState();
    httpCanceler = HttpCanceler(this);
    getLifecycle().addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LoginViewModel())
        ],
        child: Consumer<LoginViewModel>(builder: (context, viewmodel, child)) {
    _buildContext = context;
    return Scaffold(
    body: _bodyContext(context, viewmodel),
    );
    }
    );
  }

  Widget _bodyContext(BuildContext context, LoginViewModel viewModel) {
    ///CustomScrollView 包裹内容可滚动，避免键盘弹出时页面内容超出范围
    return CustomScrollView(
        slivers: [
    ///使用 SliverToBoxAdapter 将普通组件适配成为sliver可用的内容
    SliverToBoxAdapter(
    child: Stack(children: [
        //logo
        _logoWidget(),

    //登录表单
    _loginFromWidget(context, viewModel),

    //注册
    _registerWidget(context),

    //关闭页面
    _closeWidget();
    ],),
    )
    ]
    ,
    );
  }

  Widget _logoWidget() {
    return Container(
      alignment: Alignment.center,
      height: 300,
      color: Theme.of(context).primaryColor,
      child: ImageHelper.assets("ic_logo.png", width: 150, color: Colors.white),
    );
  }

  Widget _loginFromWidget(BuildContext context, LoginViewModel viewModel) {

  }

  Widget _registerWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 600),
      child: GestureDetector(
        onTap: () => actionRegister(context),
        child: Text.rich(textSpan(children: [
          TextSpan(
            text: S.of(context).no_account,
            style: const TextStyle(color: Colors.black),
          ),
          TextSpan(
            text: S.of(context).register_now,
            style: TextStyle(color: Theme.of(context).primaryColor),
          )
        ])),
      ),
    );
  }

  Widget _closeWidget() {
    return Positioned(left: 20,
        top: ScreenUtil
            .get()
            .appBarHeight,
        child: GestureDetector(
          onTap: () => actionBack(context, false),
          child: const Icon(Icons.close,
            color: Colors.white,
            size: 30,),
        ));
  }

}
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../controllers/login_controller.dart';
import '../../core/consts/assets_const.dart';
import '../../core/consts/routers_const.dart';
import '../../shared/widgets/custom_icon_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/login/already_have_an_account_acheck.dart';
import '../../shared/widgets/login/rounded_button.dart';
import 'widgets/background.dart';
import 'widgets/or_divider.dart';
import 'widgets/social_icon.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  void initState() { 
    super.initState();
    controller.context = context;
    controller.pr = ProgressDialog(context,
      isDismissible: false,
    );
  }


  Future<void> styleProgress() async {
    await Future.delayed(Duration(microseconds: 100));
    controller.pr.style(
      // message: 'Loadu',
      backgroundColor: Colors.white,
      progressWidget: LoadingBouncingGrid.square(
        backgroundColor: Theme.of(context).primaryColor,
        borderColor: Colors.white,
        borderSize: 2.0,
        size: 40.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    styleProgress();
    return Scaffold(
      key: controller.scaffoldKey,
      body: body()
    );
  }

  Widget body() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      minimum: EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(FontAwesomeIcons.commentDollar,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(width: 10,),
                Text(
                  "Controlee-se",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                    fontStyle: FontStyle.italic,
                    fontSize: 26 
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bem-vindo Cowboy!',
                  style: TextStyle(
                    color: Color(0xFF25265E),
                    fontSize: 24,
                    fontWeight: FontWeight.bold

                  ),
                ),
                SizedBox(height: 20),
                Text('Informe seus dados de acesso para entrar no aplicativo',
                  style: TextStyle(
                    color: Color(0xFF787993),
                    fontStyle: FontStyle.italic
                  ),
                ),

                // SvgPicture.asset(
                //   "assets/icons/login.svg",
                //   height: size.height * 0.1,
                // ),
                SizedBox(height: 30),
                Observer(
                  builder: (_) {
                    return CustomTextField(
                      hint: 'E-mail',
                      prefix: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress,
                      onChanged: controller.setEmail,
                      enabled: !controller.loading,
                    );
                  }
                ),
                SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return CustomTextField(
                      hint: 'Senha',
                      prefix: Icon(
                        Icons.lock, 
                        color: Theme.of(context).primaryColor,
                      ),
                      obscure: !controller.passwordVisible,
                      onChanged: controller.setPassword,
                      enabled: !controller.loading,
                      suffix: CustomIconButton(
                        radius: 32,
                        icon: Icon(
                          controller.passwordVisible ?
                            Icons.visibility_off : Icons.visibility,
                          color: Theme.of(context).primaryColor,
                        ),
                        onTap: controller.togglePasswordVisibility,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Observer(
                  builder: (_) {
                    return RoundedButton(
                      loading: controller.loading,
                      text: "LOGIN",
                      press: controller.loginPressed,
                      width: size.width * 0.3
                    );
                }),
                GestureDetector(
                  onTap: () {
                    controller.forgetPassword();
                  },
                  child: Text('Esqueceu sua senha?',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an Account ? ",
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.signUpScreen();
                      },
                      child: Text( "Sign Up",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: AssetIconsConst.faceSvg,
                      press: () {
                        controller.loginWithFace();
                      },
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      iconSrc: AssetIconsConst.googleSvg,
                      press: () async {
                        controller.auth.loginWithGoogle();
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/login_controller.dart';
import '../../core/consts/assets_const.dart';
import '../../shared/widgets/custom_icon_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/login/rounded_button.dart';
import 'widgets/or_divider.dart';
import 'widgets/social_icon.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller
  late Size size;

  @override
  void initState() { 
    super.initState();
  }


  Future<void> styleProgress() async {
    await Future.delayed(Duration(microseconds: 100));
    
  }

  @override
  Widget build(BuildContext context) {
    styleProgress();
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: body()
        ),
      )
    );
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 35,),
        header(),
        SizedBox(height: 15,),
        Column(
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
            SizedBox(height: 10,),
            OrDivider(),
            SizedBox(height: 10,),
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
                    print('teste');
                    controller.loginWithGoogle();
                  },
                ),
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget header() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
        SizedBox(height: 15,),
        Column(
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
            SizedBox(height: 30),
            Observer(
              builder: (_) {
                return CustomTextField(
                  controller: controller.emailController,
                  hint: 'E-mail',
                  prefix: Icon(
                    Icons.account_circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  textInputType: TextInputType.emailAddress,
                  // onChanged: controller.setEmail,
                  enabled: !controller.loading,
                );
              }
            ),
            SizedBox(height: 20),
            Observer(
              builder: (_) {
                return CustomTextField(
                  controller: controller.passwordController,
                  hint: 'Senha',
                  prefix: Icon(
                    Icons.lock, 
                    color: Theme.of(context).primaryColor,
                  ),
                  obscure: !controller.passwordVisible,
                  // onChanged: controller.setPassword,
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
        
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Observer(
              builder: (_) {
                return RoundedButton(
                  loading: controller.loading,
                  text: "LOGIN",
                  press: controller.loginPressed,
                  width: size.width * 0.35,
                  textColor: Theme.of(context).primaryColor,
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
      ],
    );
  }
}


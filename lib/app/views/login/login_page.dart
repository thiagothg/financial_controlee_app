import 'dart:math';

import 'package:financialcontroleeapp/app/core/theme/styles.dart';
import 'package:financialcontroleeapp/app/shared/widgets/animated/animated_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../controllers/login_controller.dart';
import '../../core/consts/assets_const.dart';
import '../../core/core_packages.dart';
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
    var portraitMode = context.widthPx < 800;

    // Calculate how wide or tall we want the form to be. 
    //Use golden ratio for nice aesthetics.
    var formWidth = max(500, context.widthPx - context.widthPx / 1.618) + 0.0;
    var formHeight = 
      max(500, context.heightPx - context.heightPx / 1.618) + 0.0;

    styleProgress();
    size = MediaQuery.of(context).size;
    return Flex(
      // Switch from row to column when in portrait mode
      direction: portraitMode ? Axis.vertical : Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Let the device screen be flexible
        // Flexible(
        //   child: _DeviceScreens(portraitMode && false),
        // ),

        SizedBox(
          width: formWidth,
          height: formHeight,
          child: SingleChildScrollView(
            child: body(),
          ),
        ),
      ],
      //   child: Scaffold(
      //   key: controller.scaffoldKey,
      //   body: SafeArea(
      //     minimum: EdgeInsets.all(30),
      //     child: SingleChildScrollView(
      //       child: body()
      //     ),
      //   )
      // ),
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


class _DeviceScreens extends StatelessWidget {
  const _DeviceScreens(this.portraitMode, {Key? key}) : super(key: key);
  final bool portraitMode;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        // color: theme.greyWeak,
        width: double.infinity,
        alignment: Alignment.center,
        child: LayoutBuilder(
          builder: (_, constraints) {
            var offsetX = 0.0, offsetY = 0.0;
            var width = portraitMode ? 500.0 : 1200.0;
            var height = 1000.0;
            List<Widget> images;
            // if (portraitMode) {
            //   images = [
            //     _LandingPageImage("dashedLine-mobile.png", Offset(0, 0), height: 250, scaleOnHover: false),
            //     // _LandingPageImage("tablet.png", Offset(0, 50), height: 350),
            //     // _LandingPageImage("phone.png", Offset(50, 500), height: 650),
            //     // _LandingPageImage("web.png", Offset(440, 600), height: 500),
            //     // _LandingPageImage("laptop.png", Offset(550, 100), height: 400),
            //   ];
            // } else {
            if (constraints.maxWidth < width) {
              offsetX = - (width - constraints.maxWidth) / 2;
            }
            images = [
              // _LandingPageImage("dashedLine-desktop.png", Offset(180, -400), height: 1300, scaleOnHover: false),
              // _LandingPageImage("tablet.png", Offset(0, 50), height: 350),
              // _LandingPageImage("phone.png", Offset(50, 500), height: 650),
              // _LandingPageImage("web.png", Offset(440, 600), height: 500),
              // _LandingPageImage("laptop.png", Offset(550, 100), height: 400),
            ];
            // }
            return Transform.translate(
              offset: Offset(offsetX, offsetY),
              child: SizedBox(
                width: width,
                height: height,
                child: Stack(clipBehavior: Clip.none, children: images),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _LandingPageImage extends StatelessWidget {
  _LandingPageImage(
    this.imagePath, 
    this.offset, {Key? key, 
      required this.height, 
      this.scaleOnHover = true
    }): super(key: key);
    
  final Offset offset;
  final String imagePath;
  final double height;
  final bool scaleOnHover;
  final ValueNotifier<bool> _isMouseOverNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMouseOverNotifier,
      builder: (_, bool isMouseOver, __) {
        var scale = isMouseOver ? 1.05 : 1.0;
        return Positioned(
          left: offset.dx,
          top: offset.dy,
          height: height,
          child: AnimatedScale(
            begin: 1,
            end: scale,
            duration: Times.fast,
            curve: Curves.easeOut,
            child: MouseRegion(
              onEnter: (_) => _isMouseOverNotifier.value = true && scaleOnHover,
              onExit: (_) => _isMouseOverNotifier.value = false,
              child: Image.asset(
                "assets/images/landing_page/$imagePath",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
        );
      },
    );
  }
}

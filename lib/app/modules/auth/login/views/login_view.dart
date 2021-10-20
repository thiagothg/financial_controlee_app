import '../../../../global/utils/components/buttons/custom_button.dart';

import '../../../../global/utils/components/animation/fade_animation.dart';

import '../../../../global/utils/components/inputs/custom_text_field.dart';
import '../../../../routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 1.0,
                  child: Center(
                    child: SvgPicture.asset(
                      Get.isDarkMode
                          ? 'assets/images/logo_branco.svg'
                          : 'assets/images/logo.svg',
                      height: Get.mediaQuery.size.height * .2,
                      semanticsLabel: 'logo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                  delay: 1.1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Hello, \nWelcome Back",
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: Get.mediaQuery.size.width * 0.1,
                          ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          FadeAnimation(
                            delay: 1.2,
                            child: CustomTextFormField(
                              hintText: 'E-mail',
                              prefixIcon: Icon(FontAwesomeIcons.solidEnvelope),
                              editingController: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              onSubmitted: (val) {
                                FocusScope.of(context).requestFocus(
                                    controller.passwordfocus.value);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FadeAnimation(
                            delay: 1.3,
                            child: Obx(
                              () => CustomTextFormField(
                                hintText: 'Senha',
                                obscure: controller.isPasswordVisible.value,
                                prefixIcon: Icon(FontAwesomeIcons.lock),
                                keyboardType: TextInputType.visiblePassword,
                                focusNode: controller.passwordfocus.value,
                                suffixIcon: IconButton(
                                  onPressed: () =>
                                      controller.togglePasswordVibility(),
                                  icon: getIconPassword(),
                                ),
                                editingController:
                                    controller.passwordController,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextButton(
                          onPressed: () => controller.forgotPassword(),
                          child: Text(
                            "Esqueceu sua senha?",
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 1.4,
                      child: Obx(
                        () => CustomButton(
                          onPressed: () {
                            controller.login();
                          },
                          text: "Entrar",
                          isLoading: controller.isLoading.value,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FadeAnimation(
                      delay: 1.5,
                      child: Center(
                        child: Text(
                          'ou entrar com',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    socialButtons(),
                    FadeAnimation(
                        delay: 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Possui conta?",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            TextButton(
                              onPressed: () => Get.toNamed(Routes.SIGNUP),
                              child: Text(
                                'Criar conta',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  Icon getIconPassword() {
    return Icon(
      controller.isPasswordVisible.value
          ? Icons.visibility_off
          : Icons.visibility,
      color: controller.isPasswordVisible.value
          ? Get.theme.iconTheme.color
          : Colors.grey,
    );
  }

  Widget socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FadeAnimation(
          delay: 1.5,
          child: GFIconButton(
            buttonBoxShadow: true,
            size: GFSize.LARGE,
            onPressed: () => controller.signInWithGoogle(),
            color: Colors.white,
            icon: SvgPicture.asset('assets/icons/google_logo.svg',
                semanticsLabel: 'Acme Logo'),
          ),
        ),
        FadeAnimation(
          delay: 1.5,
          child: GFIconButton(
            buttonBoxShadow: true,
            size: GFSize.LARGE,
            onPressed: () => controller.signInWithFacebook(),
            // text: "primary",
            icon: Icon(FontAwesomeIcons.facebookF),
          ),
        ),
        FadeAnimation(
          delay: 1.5,
          child: GFIconButton(
            buttonBoxShadow: true,
            size: GFSize.LARGE,
            onPressed: () => controller.signInWithApple(),
            color: Get.isDarkMode ? Colors.white : Colors.black,
            icon: Icon(
              FontAwesomeIcons.apple,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

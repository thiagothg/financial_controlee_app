import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../controllers/sign_up_controller.dart';
import '../../shared/widgets/custom_icon_button.dart';
import '../../shared/widgets/custom_text_field.dart';
import '../../shared/widgets/login/rounded_button.dart';

class SignUpPage extends StatefulWidget {
  final String title;
  const SignUpPage({Key? key, this.title = "SignUp"}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends ModularState<SignUpPage, SignUpController> {
  //use 'controller' variable to access controller
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      // key: controller.scaffoldKey,
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Container(
            child: body(),
          ),
        ),
      )
    );
  }


  Widget body() {
    return Column(
      children: [
        form(),
        SizedBox(height: 10),
        Observer(
          builder: (_) {
            return RoundedButton(
              loading: controller.loading,
              text: "SIGNUP",
              press: controller.loginPressed,
            );
          }
        ),
      ],
    );
  }

  Widget form() {
    return Form(
      child: Column(
        children: [
          SvgPicture.asset(
            "assets/icons/signup.svg",
            height: size.height * 0.35,
          ),

          Observer(
            builder: (_) {
              return CustomTextField(
                hint: 'Name',
                // prefix: Icon(
                //   Icons.account_circle,
                //   color: Theme.of(context).primaryColor,
                // ),
                textInputType: TextInputType.text,
                onChanged: controller.setName,
                enabled: !controller.loading,
              );
            }
          ),

          Observer(
            builder: (_) {
              return CustomTextField(
                hint: 'Your Email',
                // prefix: Icon(
                //   Icons.account_circle,
                //   color: Theme.of(context).primaryColor,
                // ),
                textInputType: TextInputType.emailAddress,
                onChanged: controller.setEmail,
                enabled: !controller.loading,
              );
            }
          ),

          Observer(
            builder: (_) {
              return CustomTextField(
                hint: 'Password',
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
          Observer(
            builder: (_) {
              return CustomTextField(
                hint: 'Confirm Password',
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
    );
  }
}
import 'package:financial_controlee_app/app/global/utils/components/animation/fade_animation.dart';
import 'package:financial_controlee_app/app/global/utils/components/buttons/custom_button.dart';
import 'package:financial_controlee_app/app/global/utils/components/inputs/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 50),
              FadeAnimation(
                delay: 1.2,
                child: Text(
                  'Cadastro',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeAnimation(
                delay: 1.2,
                child: CustomTextFormField(
                  hintText: 'Nome',
                  prefixIcon: Icon(FontAwesomeIcons.userAlt),
                  editingController: controller.nameController,
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Por favor insere nome';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1.2,
                child: CustomTextFormField(
                  hintText: 'E-mail',
                  prefixIcon: Icon(FontAwesomeIcons.solidEnvelope),
                  editingController: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Por favor insere E-mail';
                    } else if (!GetUtils.isEmail(val)) {
                      return 'Insere um Email valido.';
                    }

                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                delay: 1.2,
                child: Obx(
                  () => CustomTextFormField(
                    hintText: 'Senha',
                    prefixIcon: Icon(FontAwesomeIcons.lock),
                    editingController: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscure: controller.isPasswordVisible.value,
                    suffixIcon: IconButton(
                      onPressed: () => controller.togglePasswordVibility(),
                      icon: getIconPassword(),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Por favor insere senha';
                      } else if (!GetUtils.isGreaterThan(val.length, 5)) {
                        return 'Senha fraca.';
                      }

                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              FadeAnimation(
                delay: 1.5,
                child: Obx(
                  () => CustomButton(
                    onPressed: () => controller.signup(),
                    text: 'Cadastrar',
                    isLoading: controller.isLoading.value,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              FadeAnimation(
                delay: 1.5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tem conta ?',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Login',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
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
}

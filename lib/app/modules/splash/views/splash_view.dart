import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<SplashController>(
          init: Get.find<SplashController>(),
          initState: (_) {},
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                      Get.isDarkMode
                          ? 'assets/images/logo_branco.svg'
                          : 'assets/images/logo.svg',
                      height: Get.mediaQuery.size.height * .2,
                      semanticsLabel: 'logo'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

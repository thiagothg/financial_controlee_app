import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashController>(
        init: Get.find<SplashController>(),
        initState: (_) {},
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlutterLogo(
                size: Get.mediaQuery.size.width * .7,
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Controllese-se',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

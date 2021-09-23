import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Center(
            child: Obx(() => Text(
                  'SplashView is workin ${controller.authController.isLoggendIn}',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}

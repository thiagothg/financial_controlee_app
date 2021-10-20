import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SnackBars {
  final String title;
  final String message;

  const SnackBars({Key? key, required this.title, required this.message});

  void errorSnackbar() {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(FontAwesomeIcons.exclamationCircle, color: Colors.white),
        backgroundColor: Get.theme.errorColor,
        colorText: Colors.white);
  }

  void successSnackbar() {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        icon: Icon(FontAwesomeIcons.exclamationCircle),
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white);
  }
}

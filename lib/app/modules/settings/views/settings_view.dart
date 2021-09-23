import 'package:financial_controlee_app/app/global/utils/components/drawer/custom_drawer.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.SETTINGS_THEME);
                },
                child: const Card(
                  child: ListTile(
                    title: Text(
                      'Theme',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

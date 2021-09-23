import 'package:financial_controlee_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsThemeView extends StatelessWidget {
  SettingsThemeView({Key? key}) : super(key: key);

  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Theme'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: settingsController.themes.length,
              itemBuilder: (_, index) {
                var item = settingsController.themes[index];
                return ListTile(
                  onTap: () {
                    settingsController.changeTheme(item['theme']);
                  },
                  title: Text(
                    item['name'].toString(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: (item['desc'] != null)
                      ? Text(item['desc'].toString())
                      : null,
                  leading: Obx(() => Radio(
                        value: item['theme'] as ThemeMode,
                        groupValue: settingsController.radio.value,
                        onChanged: (ThemeMode? mode) {
                          settingsController.changeTheme(mode!);
                        },
                      )),
                );
              }),
        ));
  }
}

import 'package:financialcontroleeapp/app/controllers/settings_store.dart';
import 'package:financialcontroleeapp/app/shared/widgets/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'widgets/notification_widget_page.dart';
import 'widgets/settings_widget_page.dart';

class SettingsPage extends StatefulWidget {
  final String title;
  const SettingsPage({Key? key, this.title = "SettingsPage"}) : super(key: key);
  @override
  SettingsPageState createState() => SettingsPageState();
}
class SettingsPageState extends ModularState<SettingsPage, SettingsStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                // backgroundImage: NetworkImage(avatars[4]),
              ),
              title: Text("Damodar Lohani"),
              onTap: () {},
            ),
            SizedBox(height: 10.0),
            SettingsWidgetPage(),
            SizedBox(height: 10.0),
            NotificationWidgetPage()
          ],
        ),
      ),
    );
  }
}
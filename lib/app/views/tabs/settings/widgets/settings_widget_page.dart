import 'package:financialcontroleeapp/app/controllers/settings_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsWidgetPage extends StatefulWidget {
  static const String routeName = '/settingsWidget';

  @override
  _SettingsWidgetPageState createState() => _SettingsWidgetPageState();
}

class _SettingsWidgetPageState extends 
  ModularState<SettingsWidgetPage, SettingsStore> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text( "Settings",
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 10.0),
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 0,
          ),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Languages",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text(
                  "English US",
                  // style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {},
              ),
              Divider(),

              ListTile(
                title: Text("Theme",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text(controller.getTheme,
                  // style: greyTExt,
                ),
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey.shade400,
                ),
                onTap: () {
                  themeDialog();
                },
              ),
            ]
          ),

        ),
      ],
    );
  }

  void themeDialog() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).primaryColor,
                  blurRadius: 10.0, // has the effect of softening the shadow
                  spreadRadius: 0.0, // has the effect of extending the shadow
                )
              ],
            ),
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Theme',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Divider(),
                  SizedBox(height: 10,),
                  SimpleDialogItem(
                    text: 'Theme Light',
                    color: Colors.black,
                    icon: Icons.lightbulb_outline,
                    radioValue: ThemeMode.light,
                    selectedRadio: controller.getSelectedRadio,
                    onPressed: () {
                      print('object');
                      controller.setTheme(ThemeMode.light);
                    },
                  ),
                  SimpleDialogItem(
                    text: 'Theme Dark',
                    color: Colors.black,
                    icon: Icons.lightbulb,
                    radioValue: ThemeMode.dark,
                    selectedRadio: controller.getSelectedRadio,
                    onPressed: () {
                      print('object');
                      controller.setTheme(ThemeMode.dark);
                    },
                    onChanged: (val) {
                      if(val != null) {
                        controller.setTheme(val);
                      }
                    }
                  ),
                ]
              ),
            )
          )
        );
      }
    );
  }
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem({
    Key? key, 
    this.icon, 
    this.color, 
    required this.text, 
    this.onPressed,
    required this.radioValue,
    required this.selectedRadio,
    this.onChanged,
  }): super(key: key);

  final IconData? icon;
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  final ThemeMode radioValue;
  final ThemeMode selectedRadio;
  final void Function(ThemeMode?)? onChanged;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text('$text',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
         
          Radio(
            value: radioValue,
            groupValue: selectedRadio,
            activeColor: Colors.blue,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

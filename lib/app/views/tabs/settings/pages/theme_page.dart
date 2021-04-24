import 'package:flutter/material.dart';

class ThemePage extends StatefulWidget {
  static const String routeName = '/theme';

  @override
  _ThemePageState createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: Container()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final int page;
  final Function onTap;
  final bool highlighted;

  const DrawerTile({
    Key key, 
    @required this.icon, 
    @required this.text, 
    @required this.page, 
    @required this.onTap, 
    this.highlighted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
        color: highlighted 
        ? Theme.of(context).primaryColor 
        : Colors.black54,
      ),
      title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: highlighted 
            ? Theme.of(context).primaryColor 
            : Colors.black54,
        ),
      ),
      onTap: onTap,
    );
  }
}
import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final int page;
  final GestureTapCallback? onTap;
  final bool highlighted;

  const DrawerTile({
    Key? key, 
    required this.icon, 
    required this.text, 
    required this.page, 
    required this.onTap, 
    required this.highlighted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon,
        color: highlighted 
        ? Theme.of(context).disabledColor 
        : Theme.of(context).textTheme.subtitle2?.color,
      ),
      title: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: highlighted 
            ? Theme.of(context).disabledColor 
            : Theme.of(context).textTheme.subtitle2?.color,
        ),
      ),
      onTap: onTap,
    );
  }
}
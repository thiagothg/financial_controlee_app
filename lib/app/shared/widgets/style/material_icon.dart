import 'package:flutter/material.dart';

class MaterialIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;

  const MaterialIcon(this.icon, {Key? key, this.size = 20, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    return Icon(icon, size: size, color: color ?? Color(0xff333333));
  }
}

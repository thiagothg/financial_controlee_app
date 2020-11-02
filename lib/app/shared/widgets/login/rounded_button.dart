
import 'package:flutter/material.dart';
import '../../../core/consts/colors.conts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool loading;
  final double width;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.loading,
    this.color = ColorsConst.primaryColor,
    this.textColor = Colors.white, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width ?? _size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: color,
          onPressed: press,
          disabledColor: Theme.of(context).primaryColor.withAlpha(100),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: textColor,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
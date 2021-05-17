import 'dart:math';

import 'package:flutter/material.dart';
import '../../../core/core_packages.dart';

class StyledTooltip extends StatelessWidget {
  const StyledTooltip(this.label, {
    Key? key, 
    this.arrowAlignment = Alignment.topCenter
  }) : super(key: key);

  final String label;
  final Alignment arrowAlignment;

  @override
  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    var isOnSide = arrowAlignment.y == 0;
    // when aligned along the top of bottom, 
    //we want the arrow to have a bit of padding.
    var hzPadding = isOnSide ? 0.0 : 4.0;

    return Padding(
      padding: EdgeInsets.all(Insets.sm),
      child: Stack(
        children: [
          Positioned.fill(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: hzPadding
              ),
              child: Align(
                alignment: arrowAlignment,
                child: _Arrow(Color(0xff333333)),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xff333333), 
              borderRadius: Corners.smBorder
            ),
            padding: EdgeInsets.all(Insets.sm),
            child: Text(label, 
              style: TextStyles.caption.copyWith(color: Colors.white)
            ),
          ),
        ],
      ),
    );
  }
}

class _Arrow extends StatelessWidget {
  const _Arrow(this.color, {Key? key}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(angle: pi * .25, child: Container(width: 10, height: 10, color: color));
  }
}

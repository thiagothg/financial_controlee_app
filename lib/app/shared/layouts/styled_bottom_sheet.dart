import 'package:flutter/material.dart';

import '../../core/core_packages.dart';
import '../widgets/style/styled_spacers.dart';

class StyledBottomSheet extends StatelessWidget {
  StyledBottomSheet({required this.child});
  final Widget child;

  Widget build(BuildContext context) {
    // AppTheme theme = context.watch();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Corners.medRadius, 
          bottom: Radius.zero
        ),
        color: Colors.white,
      ),
      child: Column(children: [
        VSpace.sm,

        /// Drag Handle
        Container(
          width: 96,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: Corners.medBorder, 
            color: Color(0xffcccccc)
          ),
        ),

        /// Content
        child
      ]),
    );
  }
}

Future<void> showStyledBottomSheet<T>(BuildContext context, {
  required Widget child}) async {
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Corners.medRadius, 
          bottom: Radius.zero
        ),
      ),
      builder: (context) {
        return Wrap(
          children: [
            StyledBottomSheet(child: child),
          ],
        );
      });
}

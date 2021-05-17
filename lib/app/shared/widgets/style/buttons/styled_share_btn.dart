import 'package:flutter/material.dart';

import '../../../../core/core_packages.dart';
import '../../popover/popover_region.dart';
import '../styled_tooltip.dart';
import 'styled_buttons.dart';


class StyledSharedBtn extends StatelessWidget {
  const StyledSharedBtn({
    Key? key,
    // required this.book,
    this.iconColor,
  }) : super(key: key);
  final Color? iconColor;
  // final ScrapBookData book;

  @override
  Widget build(BuildContext context) {
    void _handleSharePressed() {
      // ClosePopoverNotification().dispatch(context);
      // CopyShareLinkCommand().run(book.documentId);
    }

    // AppTheme theme = context.watch();
    return PopOverRegion.hover(
      anchor: Alignment.centerRight,
      popAnchor: Alignment.centerLeft,
      popChild: StyledTooltip("Copy Share Link", 
        arrowAlignment: Alignment.centerLeft
      ),
      child: SimpleBtn(
        child: Padding(
          padding: EdgeInsets.all(Insets.sm),
          child: Icon(Icons.share, color: iconColor ?? Colors.white),
        ),
        onPressed: _handleSharePressed
      )
    );
  }
}

import 'package:financialcontroleeapp/app/shared/widgets/popover/popover_region.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/buttons/styled_buttons.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/material_icon.dart';
import 'package:financialcontroleeapp/app/shared/widgets/style/styled_tooltip.dart';
import 'package:flutter/material.dart';
import '../../../core/core_packages.dart';


/// Toggles the current 'enableTouchMode' settings.
/// This widget treats density inversely to the rest of the app, 
/// as it is meant to indicate the mode the user wants to switch to.
/// For example, if a user is in high density mode, 
/// using their finger, we provide a low-density (large) 
/// visual hit area for the finger
/// Conversely, if a user in in low density mode, using a mouse,
///  we provide a high-density (small)  visual hit area for the mouse
/// 
class TouchModeToggleBtn extends StatefulWidget {
  const TouchModeToggleBtn({Key? key, 
    required this.invertPopupAlign
  }) : super(key: key);

  final bool invertPopupAlign;
  @override
  _TouchModeToggleBtnState createState() => _TouchModeToggleBtnState();
}

class _TouchModeToggleBtnState extends State<TouchModeToggleBtn> {
  @override
  Widget build(BuildContext context) {
    void handleTouchModeToggled(value) {
      // ClosePopoverNotification().dispatch(context);
      // context.read<AppModel>().enableTouchMode = !value;
    }

    // AppTheme theme = context.watch();
    var touchMode = false; //context.select((AppModel m) => m.enableTouchMode);
    return Theme(
      // Override visual density for this btn, 
      //it has different rules than all other btns in the app
      data: ThemeData(visualDensity: VisualDensity.compact),
      child: SimpleBtn(
        onPressed: () => handleTouchModeToggled(touchMode),
        child: Container(
          width: 40,
          child: Stack(
            children: [
              Positioned.fill(
                  child: AnimatedPadding(
                duration: Times.fast,
                curve: Curves.easeOut,
                padding: EdgeInsets.all(touchMode ? Insets.sm : Insets.xs),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    color: Color(0xff999999).withOpacity(.3),
                  ),
                  child: PopOverRegion.hover(
                    key: ValueKey(touchMode),
                    popAnchor: widget.invertPopupAlign 
                      ? Alignment.topRight 
                      : Alignment.topLeft,
                    anchor: widget.invertPopupAlign 
                    ? Alignment.bottomRight 
                    : Alignment.bottomLeft,
                    popChild: StyledTooltip(
                      touchMode 
                        ? "Switch to Precision Mode" 
                        : "Switch to Touch Mode",
                      arrowAlignment: widget.invertPopupAlign 
                        ? Alignment.topRight 
                        : Alignment.topLeft
                    ),
                    child: MaterialIcon(
                      touchMode ? Icons.mouse : Icons.fingerprint,
                      color: Theme.of(context).accentColor,
                      size: touchMode ? 16 : 26,
                    ),
                  ),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'linux_title_bar_buttons.dart';

/// Native TitleBar for Linux, uses BitDojo platform
class LinuxTitleBar extends StatelessWidget {
  const LinuxTitleBar(this.child, {Key? key}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    // final AppTheme theme = context.watch();
    final btnColors = WindowButtonColors(
      iconNormal: Colors.black,
      mouseOver: Colors.black.withOpacity(.1),
      mouseDown: Colors.black.withOpacity(.2),
      normal: Colors.transparent,
    );
    final closeBtnColors = WindowButtonColors(
      normal: Color(0xffff392b),
      iconNormal: Colors.white,
    );

    return SizedBox(
      height: 40,
      child: Stack(
        children: [
          MoveWindow(),
          child,
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                LinuxMinimizeButton(colors: btnColors),
                appWindow.isMaximized
                    ? LinuxUnmaximizeButton(colors: btnColors)
                    : LinuxMaximizeButton(colors: btnColors),
                LinuxCloseButton(colors: closeBtnColors),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../macos_window_utils.dart';

class MacosTitleBar extends StatefulWidget {
  const MacosTitleBar(this.child, {Key? key}) : super(key: key);
  final Widget child;

  @override
  _MacosTitleBarState createState() => _MacosTitleBarState();
}

class _MacosTitleBarState extends State<MacosTitleBar> {
  late Future<double> _futureHeight;

  @override
  void initState() {
    _futureHeight = MacosWindowUtils.requestTitlebarHeight();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var defaultHeight = MacosWindowUtils.kDefaultTitlebarHeight;
    return FutureBuilder<double>(
        // Request the transparent titlebar height from the OS (async)
        future: _futureHeight,
        builder: (context, snapshot) {
          var isFutureDone = snapshot.connectionState == ConnectionState.done;
          var height = isFutureDone 
          ? snapshot.data ?? defaultHeight : defaultHeight;
          return GestureDetector(
            onDoubleTap: MacosWindowUtils.zoom,
            child: Container(
              color: Colors.transparent, 
              height: height, 
              child: widget.child
            ),
          );
        });
  }
}

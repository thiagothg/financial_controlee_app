import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffkey = GlobalKey<ScaffoldState>();

  void showSnackBar(SnackBar snackBar) {
    ScaffoldMessenger.of(scaffkey.currentContext!)
      .showSnackBar(snackBar);
    // scaffkey.currentState?.showSnackBar(snackBar);
  }
}
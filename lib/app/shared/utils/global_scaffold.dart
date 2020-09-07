import 'package:flutter/material.dart';

class GlobalScaffold {
  static final GlobalScaffold instance = GlobalScaffold();

  final scaffkey = GlobalKey<ScaffoldState>();

  void showSnackBar(SnackBar snackBar) {
    scaffkey.currentState.showSnackBar(snackBar);
  }
}
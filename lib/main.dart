import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/shared/store/page_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setLocators();
  
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

void setLocators() {
  GetIt.I.registerSingleton(PageStore());
}
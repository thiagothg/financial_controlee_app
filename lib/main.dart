import 'package:financialcontroleeapp/app/shared/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'app/app_module.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setLocators();

  runApp(ModularApp(module: AppModule()));
}

void setLocators() {
  GetIt.I.registerSingleton(PageStore());
}


import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/shared/store/app_store.dart';
import 'app/shared/store/page_store.dart';  
Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  // Status bar style on Android/iOS
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle());

  if (kIsWeb) {
    // Increase Skia cache size to support bigger images.
    const megabyte = 1000000;
    SystemChannels.skia.invokeMethod('Skia.setResourceCacheMaxBytes', 
      512 * megabyte
    );
    // TODO: cant' await on invokeMethod due to https://github.com/flutter/flutter/issues/77018  so awaiting on Future.delayed instead.
    await Future<void>.delayed(Duration.zero);
  }

  await Firebase.initializeApp();
  setLocators();
  
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}

void setLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(AppStore());
}
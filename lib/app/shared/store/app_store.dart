import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../utils/device_info.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  
  @observable
  /// Touch Mode (show btns instead of using right-click, use larger paddings)
  bool _enableTouchMode = defaultToTouchMode();
  @computed
  bool get enableTouchMode => _enableTouchMode;
  // Determines what the start value should be for touchMode, 
  //bases on the current device os
  static bool defaultToTouchMode() => DeviceOS.isMobile;


  /// Touch Mode (show btns instead of using right-click, use larger paddings)
  var _textDirection = TextDirection.ltr;
  TextDirection get textDirection => _textDirection;
  set textDirection(TextDirection value) {
     _textDirection = value;
  }

  /// Startup
  bool _hasBootstrapped = false;
  bool get hasBootstrapped => _hasBootstrapped;
  set hasBootstrapped(bool value) => _hasBootstrapped = value;


}

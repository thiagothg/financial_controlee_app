import 'package:flutter/material.dart';

import 'app_localizations.dart';

class AppTranslate {
  late final BuildContext context;

  AppTranslate(this.context);

  Future<String> text(String key,{ 
    required Map<String, String> params, 
    String defaultValue = '' }) async { 
    
    return await AppLocalizations.of(context)
    .then<String>((res) {
      var string = res?.translate(key, 
        params: params, 
        defaultValue: defaultValue
      );
      return string ?? '';
    });
  }
}
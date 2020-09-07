import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'core/consts/routers_const.dart';
import 'shared/utils/global_scaffold.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'Flutter Slidy',
      theme: Modular.get<AppController>().themeApp.getTheme(),
      themeMode: Modular.get<AppController>().themeMode,
      initialRoute: RoutersConst.splash,
      onGenerateRoute: Modular.generateRoute,
      builder: (context, child) {
        return Scaffold(
          key: GlobalScaffold.instance.scaffkey,
          body: child,
        );
      },
    );
  }
}

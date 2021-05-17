import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'app_controller.dart';
import 'core/consts/routers_const.dart';
import 'core/localization/generated/l10n.dart';
import 'core/theme/app_theme_dark.dart';
import 'core/theme/app_theme_light.dart';
import 'shared/layouts/main_app_scaffold.dart';
import 'shared/utils/global_scaffold.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'main',
      key: UniqueKey(),
      builder: (_) {
        return MaterialApp(
          title: 'Flutter Slidy',
          darkTheme: AppThemeDark().getTheme(context),
          theme: AppThemeLight().getTheme(context),
          // theme: Modular.get<AppController>().themeApp.getTheme(context),
          themeMode: Modular.get<AppController>().themeMode,
          initialRoute: RoutersConst.splash,
          // onGenerateRoute: Modular.generateRoute,
          debugShowCheckedModeBanner: false,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: [
            S.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode &&
                  supportedLocale.countryCode == locale?.countryCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
          builder: EasyLoading.init(
            builder:  (context, child) {
              Intl.defaultLocale = 'pt_BR';
              setStyleLoading(context);

              // bool hasBootstrapped = appModel.hasBootstrapped;
              var showSplash = false;
              var route = Modular.to;

              print(route.path);
              // showSplash = (Modular.to.modulePath != RoutersConst.splash);

              return MainAppScaffold(
                showAppBar: showSplash,
                pageNavigator: child!,
                //               child: Scaffold(
                //   backgroundColor: Colors.white,
                //   key: GlobalScaffold.instance.scaffkey,
                //   body: child,
                // ),
              );
            },
          ),
        ).modular();
      }
    );
  }

  void setStyleLoading(BuildContext context) {
    EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Theme.of(context).primaryColor
    ..backgroundColor = Colors.grey
    ..indicatorColor = Colors.yellow
    ..textColor = Theme.of(context).textTheme.bodyText2?.color!
    ..maskColor = Colors.black.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
  }
}

import 'package:financial_controlee_app/app/theme/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/global/bindings/initial_binding.dart';
import 'app/global/core/localization/generated/l10n.dart';
import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

Future<void> main() async {
  GestureBinding.instance?.resamplingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();

  ///
  await Firebase.initializeApp();

  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStyleLoading(context);
    return GetMaterialApp(
      initialBinding: InitialBinding(),
      title: "Controllese-se",
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeService().getThemeMode(),
      defaultTransition: Transition.fade,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      }),
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Get.deviceLocale,
      unknownRoute: GetPage(
          name: '/notfound',
          page: () => Scaffold(
                body: Center(
                  child: Text('UnknownRoutePage'),
                ),
              )),
      // home: snapshot.data != null ? HomeView() : LoginView(),
    );
  }
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

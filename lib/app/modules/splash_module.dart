import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/splash_controller.dart';
import '../views/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => SplashController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => SplashPage()),
  ];

  // static Inject get to => Inject<SplashModule>.of();
}

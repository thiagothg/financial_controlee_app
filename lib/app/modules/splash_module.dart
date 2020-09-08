import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/splash_controller.dart';
import '../core/consts/routers_const.dart';
import '../screens/splash/splash_page.dart';

class SplashModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(RoutersConst.splash, child: (_, args) => SplashPage()),
      ];

  static Inject get to => Inject<SplashModule>.of();
}

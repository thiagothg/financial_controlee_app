import 'package:flutter_modular/flutter_modular.dart';
import '../../core/consts/routers_const.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
    Router(RoutersConst.home, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}

import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../views/tabs/dashboard/dashboard_page.dart';


class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
    Bind((i) => DashboardController()),
  ];

  // static Inject get to => Inject<DashboardModule>.of();


  @override
  List<ModularRoute> get routes => [
    ChildRoute(Modular.initialRoute, child: (_, args) => DashboardPage()),
  ];
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controllers/dashboard_controller.dart';
import '../screens/tabs/dashboard/dashboard_page.dart';


class DashboardModule extends WidgetModule {
  @override
  List<Bind> get binds => [
    Bind((i) => DashboardController()),
  ];

  static Inject get to => Inject<DashboardModule>.of();

  @override
  Widget get view => DashboardPage();
}

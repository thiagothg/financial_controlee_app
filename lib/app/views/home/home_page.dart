import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/home_controller.dart';
import '../../modules/dashboard_module.dart';
import '../../modules/year/year_goal_module.dart';
import '../../shared/store/page_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final PageStore pageStore = GetIt.I<PageStore>();
  
  @override
  void initState() { 
    super.initState();
    reaction(
      (_) => pageStore.page,
      (page) => pageStore.pageController.jumpToPage(page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageStore.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        DashboardModule(),
        RouterOutlet(module: YearGoalModule()),
        Container(color: Colors.red),
        Container(color: Colors.yellow),
        Container(color: Colors.blue)

      ],
    );
  }
}

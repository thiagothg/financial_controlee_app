import 'package:financialcontroleeapp/app/screens/tabs/dashboard/dashboard_page.dart';
import 'package:financialcontroleeapp/app/screens/tabs/year_goal/year_goal_page.dart';
import 'package:financialcontroleeapp/app/shared/store/page_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/home_controller.dart';
import '../../modules/dashboard_module.dart';
import '../../modules/year_goal_module.dart';

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
        DashboardPage(),
        YearGoalPage(),
        Container(color: Colors.red),
        Container(color: Colors.yellow),
        Container(color: Colors.blue)

      ],
    );
  }
}

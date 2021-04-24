import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/home_controller.dart';
import '../../shared/store/page_store.dart';
import '../../shared/widgets/drawer/custom_drawer.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final PageStore pageStore = GetIt.I<PageStore>();
  
  @override
  void initState() { 
    super.initState();
    // reaction(
    //   (_) => pageStore.page,
    //   (page) => pageStore.pageController.jumpToPage(page ?? 0)
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: RouterOutlet(),
    );

    // return PageView(
    //   controller: pageStore.pageController,
    //   physics: NeverScrollableScrollPhysics(),
    //   children: [
    //     // DashboardModule(),
    //     // Container(color: Colors.red),
        
    //     // RouterOutlet(),
    //     // // DashboardModule(),
    //     // ModuleRoute(module: YearGoalModule()),
    //     // Container(color: Colors.yellow),
    //     // Container(color: Colors.blue)

    //   ],
    // );
  }
}

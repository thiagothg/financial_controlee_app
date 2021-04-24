import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/year/year_goal_controller.dart';
import '../../../core/consts/routers_const.dart';
import '../../../core/localization/generated/l10n.dart';
import '../../../shared/widgets/drawer/custom_drawer.dart';

class YearGoalPage extends StatefulWidget {
  final String title;
  const YearGoalPage({Key? key, this.title = "YearGoal"}) : super(key: key);

  @override
  _YearGoalPageState createState() => _YearGoalPageState();
}

class _YearGoalPageState
    extends ModularState<YearGoalPage, YearGoalController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: UniqueKey(),
      drawer: CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/${RoutersConst.goalsCreate}', forRoot: true);
        },
        tooltip: 'add goal',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return BottomNavigationBar(
          currentIndex: controller.getSelectedIndex,
          onTap: (index) {
            if (index == 0) {
              Modular.to.navigate('${RoutersConst.year}/goal');
            } else if (index == 1) {
              Modular.to.navigate('${RoutersConst.year}/about');
            }
              
            Future.delayed(Duration(milliseconds: 200))
              .then((value) => controller.setSelectIndex(index));
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: S.current.titleYearGoals,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: S.current.titleYearAbout,
            ),
          ],
        );
      }),
      appBar: AppBar(
        key: UniqueKey(),
        title: Text(S.current.titleYearGoal),
      ),
      body: RouterOutlet(),
    );
  }
}

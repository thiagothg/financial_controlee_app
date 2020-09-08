import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../controllers/year_goal_controller.dart';
import '../../../shared/widgets/drawer/custom_drawer.dart';
import 'pages/goals/goals_page.dart';

class YearGoalPage extends StatefulWidget {
  final String title;
  const YearGoalPage({Key key, this.title = "YearGoal"}) : super(key: key);

  @override
  _YearGoalPageState createState() => _YearGoalPageState();
}

class _YearGoalPageState
    extends ModularState<YearGoalPage, YearGoalController> {
  //use 'controller' variable to access controller
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () { 
          // Modular.to.pushNamed(route);
        },
        tooltip: 'add goal',
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
      bottomNavigationBar: AnimatedBuilder(
        animation: controller.pageController,
        builder: (context, snapshot) {
          return BottomAppBar(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              currentIndex: controller.pageController?.page?.round() ?? 0,
              onTap: (index) {
                controller.pageController.jumpToPage(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Goals'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  title: Text('About'),
                ),  
              ],

            ),
          );
          // return BottomNavigationBar(
            
          //   selectedItemColor: Colors.amber[800],
          //   items: [
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         title: Text('Goals'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.add),
          //       title: Text('Add'),
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.school),
          //       title: Text('About'),
          //     ),  
          //   ],
          // );
        }
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: controller.pageController,
        children: [
          GoalsPage(),
          Container(),
        ],
      )
    );
  }
}

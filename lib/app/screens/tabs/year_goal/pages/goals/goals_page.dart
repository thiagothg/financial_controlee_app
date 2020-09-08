import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../controllers/year/goals_controller.dart';
import '../../../../../models/goal_model.dart';
import 'widgets/goal_card.dart';

class GoalsPage extends StatefulWidget {
  final String title;
  const GoalsPage({Key key, this.title = "Goals"}) : super(key: key);

  @override
  _GoalsPageState createState() => _GoalsPageState();
}

class _GoalsPageState extends ModularState<GoalsPage, GoalsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(widget.title,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: ListView.builder(
        itemCount: GoalModel.list.length,
        itemBuilder: (_, index) {
          return GoalCard(model: GoalModel.list[index],);
        },
      ),
    );
  }
}

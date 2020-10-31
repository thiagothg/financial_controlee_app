import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../controllers/year/create_goals_controller.dart';

class CreateGoalsPage extends StatefulWidget {
  final String title;
  const CreateGoalsPage({Key key, this.title = "CreateGoals"})
      : super(key: key);

  @override
  _CreateGoalsPageState createState() => _CreateGoalsPageState();
}

class _CreateGoalsPageState
    extends ModularState<CreateGoalsPage, CreateGoalsController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}

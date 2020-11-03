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
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Text('What is your next goal?',
              style: Theme.of(context).textTheme.headline5.copyWith(
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20),
            Text('What do you'),

            TextFormField()
          ],
        ),
      ),
    );
  }
}

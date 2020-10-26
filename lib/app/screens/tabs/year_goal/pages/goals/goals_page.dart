import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      body: Observer(
        builder: (_) {
          return StreamBuilder<List<GoalModel>>(
            stream: controller.goals,
            builder: (context, snapshot) {
              print(snapshot.connectionState);
              if(snapshot.hasError) {
                return Text('Error');
              } else {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());
                    break;
                  case ConnectionState.active:
                  case ConnectionState.done:
                    print(snapshot.data.length);
                    if(snapshot.data.length > 0) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, index) {
                          return GoalCard(model: snapshot.data[index],);
                        },
                      );
                    } else {
                      return Text('no');
                    }
                    break;
                }
                return Container();
              }
            }
          );
        }
      ),
    );
  }
}

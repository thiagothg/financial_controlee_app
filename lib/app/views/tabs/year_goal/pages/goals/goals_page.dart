import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../controllers/year/goals_controller.dart';
import '../../../../../models/goal_model.dart';
import '../../../../../shared/widgets/error_widget.dart';
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
      body: StreamBuilder<List<GoalModel>>(
        stream: controller.getGoals(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            print(snapshot.error);
            return ErrorPage();
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
                break;
              case ConnectionState.active:
              case ConnectionState.done:
                if(snapshot.data.length > 0) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (_, index) {
                      return GoalCard(model: snapshot.data[index],);
                    },
                  );
                } else {
                  return emptyList();
                }
                break;
            }
            return Text('Error');
          }
        }
      ),
    );
  }

  Widget emptyList() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.bullseye,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 10),
              Text('Nao tem nenhum objetivo cadastro.',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../controllers/year/goals_controller.dart';
import '../../../../../models/goal_model.dart';
import '../../../../../shared/widgets/error_widget.dart';
import '../../../../../shared/widgets/helpers.dart';
import 'widgets/goal_card.dart';

class GoalsPage extends StatefulWidget {
  final String title;
  const GoalsPage({Key? key, this.title = "Goals"}) : super(key: key);

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
        key: UniqueKey(),
        stream: controller.getGoals(),
        builder: (context, snapshot) {
          if(snapshot.hasError) {
            return ErrorPage();
          } else {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return noConnection();
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.done:
                if(snapshot.hasData) {
                  var length = (snapshot.data != null)
                    ? snapshot.data?.length : 0;
                  if(length! > 0) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (_, index) {
                        var item = snapshot.data?[index];
                        return GestureDetector(
                          onLongPress: () {
                            
                          },
                          child: GoalCard(
                            model: item!,
                          ),
                        );
                      },
                    );
                  } else {
                    return emptyList('Nao tem nenhum objetivo cadastro.');
                  }
                } else {
                  return emptyList('Nao tem nenhum objetivo cadastro.');
                }
            }
          }
        }
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

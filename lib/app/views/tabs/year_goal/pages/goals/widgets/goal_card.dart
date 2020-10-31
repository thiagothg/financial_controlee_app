import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';

import '../../../../../../core/consts/routers_const.dart';
import '../../../../../../models/goal_model.dart';

class GoalCard extends StatelessWidget {

  final GoalModel model;

  const GoalCard({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoutersConst.goalDetail, 
          arguments: model);
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        shape: Theme.of(context).cardTheme.shape,
        borderOnForeground: false,
        color: Theme.of(context).cardTheme.color,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          width: _size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container()
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remaingn weeks',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text('43',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ends at',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(model?.dateEnd?.toDate().toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(height: 15),
              FAProgressBar(
                progressColor: Theme.of(context).indicatorColor,
                animatedDuration: Duration(milliseconds: 600),
                size: 18,
                backgroundColor: Theme.of(context).disabledColor,
                currentValue: model.progress,
                displayText: '%'
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('R\$ 222,00',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text('of',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text('R\$ 6.8890,00',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
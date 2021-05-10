import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../../../controllers/year/goals_controller.dart';
import '../../../../../../core/consts/routers_const.dart';
import '../../../../../../models/goal_model.dart';

class GoalCard extends StatefulWidget {

  final GoalModel model;

  GoalCard({Key? key, required this.model}) : super(key: key);

  @override
  _GoalCardState createState() => _GoalCardState();
}

class _GoalCardState extends ModularState<GoalCard, GoalsController> {
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RoutersConst.goalDetail, 
          arguments: widget.model);
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
                  Text(widget.model.title,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Container(
                    child: showBottowActions(widget.model),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remaingn weeks',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(widget.model.getRemainWeeks(),
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ends at',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(DateFormat.yMd().format(widget.model.dateEnd),
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              FAProgressBar(
                progressColor: Theme.of(context).indicatorColor,
                animatedDuration: Duration(milliseconds: 600),
                size: 18,
                backgroundColor: Theme.of(context).disabledColor,
                currentValue: widget.model.progress,
                displayText: '%'
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.model.getMoneyFormat(widget.model.qtdSaved),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text('of',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(width: 5),
                  Text(widget.model.getMoneyFormat(widget.model.moneyEnd),
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

  PopupMenuButton showBottowActions(GoalModel goalModel) {
    return PopupMenuButton(
      padding: EdgeInsets.zero,
      iconSize: 32,
      onSelected: (val) {
        print('selected');
        switch (val) {
          case 1: //Editar
            
            break;
          case 2: //Excluir
            
            break;
          default:
        }
        print(val);
      },
      itemBuilder: (_) {
        return [
          PopupMenuItem(
            value: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.edit
  
                ),
                SizedBox(width: 7),
                Container(
                  child: Text('Editar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(FontAwesomeIcons.trash,
                  color: Colors.red.shade800,
                ),
                SizedBox(width: 7),
                Container(
                  child: Text('Excluir',
                    style: TextStyle(
                      color: Colors.red.shade800,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ],
            ),
          ),
        ];
      }

    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../../../controllers/year/goals_controller.dart';
import '../../../../../../models/goal_model.dart';

class HeaderWidget extends StatelessWidget {

  final GoalModel model;

  HeaderWidget({Key? key, required this.model}) : super(key: key);

  final GoalsController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
   
    return Container(
      height: _size.height * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40.0),
           bottomLeft: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Observer(builder: (_) {
        return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: CircularPercentIndicator(
              animationDuration: 1200,
              radius: 120.0,
              lineWidth: 15.0,
              percent: controller.getProgress.round() / 100,
              center: Text("${controller.getProgress.toString()}%"),
              progressColor: Colors.green,
              circularStrokeCap: CircularStrokeCap.butt,
              backgroundColor: Theme.of(context).disabledColor,
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${model.getMoneyFormat(model.qtdSaved)}'
                    ' / ${model.getMoneyFormat(model.moneyEnd)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ]
              ),
            ),
          ),
        ]
      );
      })
    );
  }
}
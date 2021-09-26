import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_model.dart';
import 'package:financial_controlee_app/app/global/utils/utils.dart';
import 'package:financial_controlee_app/app/modules/goals/year_goal_chalenge/controllers/year_goal_challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HeaderWidget extends StatelessWidget {
  final YearGoalChallenge model;

  HeaderWidget({Key? key, required this.model}) : super(key: key);

  final YearGoalChallengeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.mediaQuery.size.width * 0.65,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1200,
                radius: 120.0,
                lineWidth: 15.0,
                percent: model.progress / 100,
                center: Text("${(model.progress).toInt()}%"),
                progressColor: Theme.of(context).primaryColor,
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Theme.of(context).disabledColor,
                curve: Curves.easeIn),
          ),
          SizedBox(height: 30),
          Center(
            child: Container(
              alignment: Alignment.center,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  '${Utils().getMoneyFormat(model.qtdSaved)}'
                  ' / ${Utils().getMoneyFormat(model.total)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

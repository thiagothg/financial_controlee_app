import 'package:financial_controlee_app/app/global/utils/utils.dart';

import '../controllers/year_goal_challenge_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class YearGoalChallengePreviewView extends StatelessWidget {
  final YearGoalChallengeController yearGoalController = Get.find();

  YearGoalChallengePreviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Goal Review'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'To achive your objective',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        yearGoalController.goalModel.value!.title,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'You must save',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Week 01',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'to',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'week 52',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2!
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${DateFormat.yMd().format(yearGoalController.goalModel.value!.dateStart)} ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                    ' ${DateFormat.yMd().format(yearGoalController.goalModel.value!.dateEnd)}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    ' ${Utils().getMoneyFormat(yearGoalController.goalModel.value!.moneyStart)}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Text(
                                    ' ${Utils().getMoneyFormat(yearGoalController.goalModel.value!.moneyEnd)}',
                                    style:
                                        Theme.of(context).textTheme.bodyText2)
                              ])
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Amount saved',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        ' ${Utils().getMoneyFormat(yearGoalController.goalModel.value!.total)}',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

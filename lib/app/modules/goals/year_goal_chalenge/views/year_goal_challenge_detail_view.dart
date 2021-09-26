import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_model.dart';
import 'package:financial_controlee_app/app/modules/goals/year_goal_chalenge/controllers/year_goal_challenge_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widgets/header_widget.dart';
import 'widgets/week_item_card.dart';

class YearGoalChallengeDetailView extends GetView {
  final YearGoalChallenge model = Get.arguments;

  YearGoalChallengeDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.title),
        centerTitle: true,
      ),
      body: GetBuilder<YearGoalChallengeController>(
        // tag: 'detail',
        init: Get.find<YearGoalChallengeController>(),
        // initState: (c) {
        //   c.controller?.goalModel = model.obs;
        //   print(c.controller?.goalModel);
        // },
        builder: (c) {
          c.goalModel = model.obs;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              HeaderWidget(model: c.goalModel.value!),
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                    itemCount: c.goalModel.value!.weeksGoal!.length,
                    separatorBuilder: (_, index) {
                      return SizedBox(height: 5, child: Divider(height: 3));
                    },
                    itemBuilder: (_, index) {
                      var item = c.goalModel.value!.weeksGoal![index].obs;
                      return WeekGoalCard(
                        model: item,
                        index: index,
                        onPressed: (val) {
                          c.toggle(item.value, val, index);
                        },
                      );
                    }),
              ),
              SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}

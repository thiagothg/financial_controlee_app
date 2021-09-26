import 'package:financial_controlee_app/app/data/model/goals/year_goal_challenge_model.dart';
import 'package:financial_controlee_app/app/global/utils/components/drawer/custom_drawer.dart';
import 'package:financial_controlee_app/app/global/utils/components/loaders/refresh_widget.dart';
import 'package:financial_controlee_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/year_goal_challenge_controller.dart';
import 'widgets/year_goal_card.dart';

class YearGoalChallengeView extends GetView<YearGoalChallengeController> {
  const YearGoalChallengeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('52 weeks goal'),
        centerTitle: true,
      ),
      body: RefreshWidget(
        onRefresh: () async {
          controller.onRefresh();
        },
        child: controller.obx(
            (listGoals) => ListView.builder(
                itemCount: (listGoals as List).length,
                itemBuilder: (_, index) {
                  var item = listGoals[index] as YearGoalChallenge;
                  return InkWell(
                    child: YearGoalCard(
                      model: item,
                      onDelete: () {
                        controller.delete(item.id!);
                      },
                    ),
                  );
                }),
            onError: (err) => Center(child: Text('$err')),
            onEmpty: Center(child: Text('Nenhum Objetivo encontrado.')),
            onLoading: Center(
              child: CircularProgressIndicator(),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.YEAR_GOAL_CHALLENGE_ADD);
        },
        child: const Icon(Icons.add),
        // backgroundColor: Colors.green,
      ),
    );
  }
}

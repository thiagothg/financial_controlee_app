import 'package:financial_controlee_app/app/global/utils/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goal_controller.dart';

class GoalView extends GetView<GoalController> {
  const GoalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('GoalView'),
        centerTitle: true,
      ),
    );
  }
}

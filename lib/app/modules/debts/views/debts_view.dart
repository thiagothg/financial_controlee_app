import 'package:financial_controlee_app/app/global/utils/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/debts_controller.dart';

class DebtsView extends GetView<DebtsController> {
  const DebtsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('DebtsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DebtsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

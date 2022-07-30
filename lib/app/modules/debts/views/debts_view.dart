import '../../../global/utils/components/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/debts_controller.dart';
import 'tabs/borrowed/borrowed_tab_view.dart';
import 'tabs/lent/lent_tab_view.dart';

class DebtsView extends GetView<DebtsController> {
  const DebtsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Debts'),
        centerTitle: true,
        bottom: TabBar(
          controller: controller.tabController,
          tabs: controller.myTabs,
          onTap: controller.onChangedTab
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.clockRotateLeft)),
        ],
      ),
      body: TabBarView(controller: controller.tabController, children: [
        BorrowedTabView(),
        LentTabView(),
      ]),
    );
  }
}

import '../../../data/model/debts/borrowed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DebtsController extends GetxController
    with SingleGetTickerProviderMixin, StateMixin {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'I Borrored'),
    Tab(text: 'I lent'),
  ];

  TabController? tabController;

  // Borrored Page
  RxList<Borrowed> listBorrowed = <Borrowed>[].obs;
  RxDouble totalBorrowed = RxDouble(10.0);

  //add Page
  Rx<String?> dropdownValue = Rx(null);
  List<String> typeDebts = ['I borrewd', 'I lent'];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: myTabs.length);
    loadData();
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }

  void loadData() async {
    listBorrowed = [
      Borrowed(
          id: '1',
          dateStart: DateTime.now(),
          dateEnd: DateTime.now().add(Duration(days: 30)),
          note: 'TESTE',
          total: 100000,
          userUid: '123',
          title: 'Borrowed 1'),
      Borrowed(
          id: '2',
          dateStart: DateTime.now(),
          // dateEnd: DateTime.now().add(Duration(days: 60)),
          note: 'TESTE 2',
          total: 1000,
          userUid: '123',
          title: 'Borrowed 2'),
    ].obs;
    await Future.delayed(Duration(seconds: 2));
    change(listBorrowed, status: RxStatus.success());
  }
}

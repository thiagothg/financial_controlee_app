import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LentTabView extends GetView {
  const LentTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LentTabView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LentTabView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

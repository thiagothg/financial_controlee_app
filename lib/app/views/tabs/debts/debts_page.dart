import 'package:flutter/material.dart';

import '../../../shared/widgets/drawer/custom_drawer.dart';

class DebtsPage extends StatefulWidget {
  final String title;
  const DebtsPage({Key? key, this.title = "DebtsPage"}) : super(key: key);
  @override
  DebtsPageState createState() => DebtsPageState();
}
class DebtsPageState extends State<DebtsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
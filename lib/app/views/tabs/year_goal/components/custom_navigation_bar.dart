import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CustomNavigationBarState();
  // _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  List<NavigationItem> items = [
    NavigationItem(
      icon: Icon(Icons.home),
      title: Text('home')
    ),
    NavigationItem(
      icon: Icon(Icons.home),
      title: Text('add')
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          return GestureDetector(
            child: _buildItem(item, false),
          );
        }).toList()
      ),
    );
  }

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return Row(
      children: [
        item.icon,
        item.title
      ],
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;


  NavigationItem({ required this.icon, required this.title});
}
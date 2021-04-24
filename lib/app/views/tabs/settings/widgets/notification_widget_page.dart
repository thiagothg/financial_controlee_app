import 'package:flutter/material.dart';

class NotificationWidgetPage extends StatefulWidget {
  final String title;
  const NotificationWidgetPage({Key? key, 
    this.title = "NotificationWidgetPage"}) : super(key: key);
  @override
  NotificationWidgetPageState createState() => NotificationWidgetPageState();
}
class NotificationWidgetPageState extends State<NotificationWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text( "Notification",
          style: Theme.of(context).textTheme.headline4,
        ),
        SizedBox(height: 10.0),
        Card(
          elevation: 2,
          margin: EdgeInsets.symmetric(
            vertical: 4.0,
            horizontal: 0,
          ),
          child: Column(
            children: <Widget>[
              SwitchListTile(
                title: Text("Push Notifications",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text(
                  "Off",
                  // style: greyTExt,
                ),
                value: false,
                onChanged: (val) {},
              ),
              Divider(),

              SwitchListTile(
                title: Text( "Email Notifications",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                subtitle: Text("On",
                  // style: greyTExt,
                ),
                value: true,
                onChanged: (val) {},
              ),
            ]
          ),
        ),
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/global_scaffold.dart';

Widget emptyList(String? text) {
  var context = GlobalScaffold.instance.scaffkey.currentContext;
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.bullseye,
              color: Theme.of(context!).primaryColor,
            ),
            SizedBox(width: 10),
            Text('$text',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    ),
  );
}


Widget noConnection() {
  var context = GlobalScaffold.instance.scaffkey.currentContext;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.wifi,
                color: Theme.of(context!).primaryColor,
              ),
              SizedBox(width: 10),
              Text('Nao connection',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
            ],
          )
        ],
      ),
    );
  }
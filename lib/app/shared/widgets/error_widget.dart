import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(FontAwesomeIcons.exclamation,
                color: Theme.of(context).primaryColor,
              ),
              Container(
                child: Text('Ocorreu Erro!',
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold
                  ), 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
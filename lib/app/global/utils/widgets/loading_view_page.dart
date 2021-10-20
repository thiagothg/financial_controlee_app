import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Color? color;
  const LoadingView({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
          // valueColor: AlwaysStoppedAnimation<Color>(),
          ),
    );
  }
}

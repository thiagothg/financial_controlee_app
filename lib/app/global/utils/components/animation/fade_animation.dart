import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  const FadeAnimation({required this.delay, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = TimelineTween<AniProps>()
      ..addScene(
              begin: Duration(milliseconds: 500),
              duration: const Duration(seconds: 1))
          .animate(AniProps.opacity, tween: Tween(begin: 0.0, end: 1.0))
      ..addScene(
              begin: Duration(milliseconds: 500),
              duration: const Duration(seconds: 1))
          .animate(AniProps.y,
              tween: Tween(begin: -30.0, end: 0.0), curve: Curves.easeOut);

    return PlayAnimation<TimelineValue<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AniProps.opacity), //animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, value.get(AniProps.y)), child: child),
      ),
    );
  }
}

enum AniProps { x, y, opacity }

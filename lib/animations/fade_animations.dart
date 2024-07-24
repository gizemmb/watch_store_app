import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

class FadeAnimations extends StatelessWidget {
  const FadeAnimations({required this.delay, required this.child, super.key});
  final double delay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final opacityTween = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).chain(CurveTween(curve: Curves.easeOut));

      final translateYTween = Tween<double>(
      begin: -30.0,
      end: 0.0,
    ).chain(CurveTween(curve: Curves.easeOut));

    return PlayAnimationBuilder<double>(
      tween: opacityTween,
      duration: 100.milliseconds,
      delay: (delay * 100).round().milliseconds,
      builder: (context, opacityValue, child) {
        return PlayAnimationBuilder<double>(
          tween: translateYTween,
          duration: 500.milliseconds,
          delay: (delay * 100).round().seconds,
          builder: (context, translateYValue, child) {
            return Opacity(
              opacity: opacityValue,
              child: Transform.translate(
                offset: Offset(0, translateYValue),
                child: child,
              ),
            );
          },
          child: child,
        );
      },
      child: child,
    );
  }
}

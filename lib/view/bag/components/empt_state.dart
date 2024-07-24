import 'package:flutter/material.dart';
import '../../../animations/fade_animations.dart';
import '../../../theme/custom_app_theme.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildFadeText(
            text: 'No shoes added!',
            style: AppThemes.bagEmptyListTitle,
            delay: 1,
          ),
          _buildFadeText(
            text: 'Once you have added, come back :)',
            style: AppThemes.bagEmptyListSubTitle,
            delay: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildFadeText({
    required String text,
    required TextStyle style,
    required double delay,
  }) {
    return FadeAnimations(
      delay: delay,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}

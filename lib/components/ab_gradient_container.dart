import 'dart:ui';

import 'package:aubilous/resourses/app_colors.dart';
import 'package:flutter/material.dart';

enum GradientTheme {
  orange,
  blue,
}

class AbGradientContainer extends StatelessWidget {
  final GradientTheme theme;
  final Widget child;
  const AbGradientContainer({this.theme = GradientTheme.orange, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> orangeTheme = [
      AppColors.primary,
      AppColors.primary.shade600,
    ];
    final List<Color> blueTheme = [
      AppColors.accent,
      AppColors.accent.shade600,
    ];

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(-0.8, -0.8),
          radius: 1,
          colors: theme == GradientTheme.orange ? orangeTheme : blueTheme,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40,
            right: -40,
            child: IgnorePointer(
              ignoring: true,
              child: BackdropFilter(
                filter: ImageFilter.blur(),
                blendMode: BlendMode.overlay,
                child: Opacity(
                  opacity: .8,
                  child: Image.asset(
                    "lib/assets/images/logo.png",
                    width: MediaQuery.of(context).size.width,
                    colorBlendMode: BlendMode.overlay,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: child,
          ),
        ],
      ),
    );
  }
}

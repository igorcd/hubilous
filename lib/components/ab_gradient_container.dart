import 'dart:ui';

import 'package:aubilous/resourses/app_gradients.dart';
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
    return Container(
      decoration: BoxDecoration(
        gradient: theme == GradientTheme.orange ? AppGradients.primary : AppGradients.accent,
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

import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class TaskHeader extends StatelessWidget {
  final String title;
  const TaskHeader({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    final deltaExtent = settings.maxExtent - settings.minExtent;
    final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0);

    // Opacidade dos textos
    final double opacity = 1 - math.min(1, t * 2);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        //
        // Nome do usuário
        Positioned(
          top: 13,
          left: 50,
          right: 30,
          child: Opacity(
            opacity: 1 - opacity,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.white, fontSize: AppSizes.s05),
            ),
          ),
        ),
        //
        // Nome do usuário
        Positioned(
          top: 55,
          left: 30,
          right: 30,
          child: Opacity(
            opacity: opacity,
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ],
    );
  }
}

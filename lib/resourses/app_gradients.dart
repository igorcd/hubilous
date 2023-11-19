import 'package:aubilous/resourses/app_colors.dart';
import 'package:flutter/material.dart';

class AppGradients {
  static final primary = RadialGradient(
    center: const Alignment(-0.8, -0.8),
    radius: 1,
    colors: [
      AppColors.primary,
      AppColors.primary.shade600,
    ],
  );
  static final accent = RadialGradient(
    center: const Alignment(-0.8, -0.8),
    radius: 1,
    colors: [
      AppColors.accent,
      AppColors.accent.shade600,
    ],
  );
}

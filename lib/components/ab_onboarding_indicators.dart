import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbOnboardingIndicators extends StatelessWidget {
  final int index;
  final int length;
  const AbOnboardingIndicators({required this.index, required this.length, super.key});

  @override
  Widget build(BuildContext context) {
    Widget renderIndicator(int indicatorIndex) {
      return AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: index == indicatorIndex ? 1 : .5,
        child: Container(
          width: AppSizes.s02,
          height: AppSizes.s02,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
          ),
        ),
      );
    }

    return Wrap(
      direction: Axis.horizontal,
      spacing: AppSizes.s01,
      alignment: WrapAlignment.center,
      children: List.generate(length, (index) => renderIndicator(index)),
    );
  }
}

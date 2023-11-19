import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:flutter/material.dart';

class FaqFeature extends StatelessWidget {
  const FaqFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return AbGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: AbIconButton(
            icon: AppIcons.angleLeft,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            "FAQ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

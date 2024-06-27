import 'package:aubilous/components/ab_bot.dart';
import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:flutter/material.dart';

class ManagerBotFeature extends StatelessWidget {
  const ManagerBotFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return AbGradientContainer(
      theme: GradientTheme.blue,
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
            "Aubot",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: const AbBot("clp5ezspa0005ia0fqj6usb4c"),
      ),
    );
  }
}

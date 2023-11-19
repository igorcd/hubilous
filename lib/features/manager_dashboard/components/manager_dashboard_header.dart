import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/features/timeline/components/language_selector.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class ManagerDashboardHeader extends StatelessWidget {
  const ManagerDashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppSizes.s04,
          right: AppSizes.s07,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                AbIconButton(onPressed: () => Scaffold.of(context).openDrawer(), icon: AppIcons.menu),
                const Spacer(),
                const LanguageSelector(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Hello",
                    style: textTheme.displaySmall,
                  ),
                  Text(
                    "Gabriel Lima",
                    style: textTheme.displayLarge,
                  ),
                  const SizedBox(height: AppSizes.s06),
                  const Text(
                    "Here you can check some informations abour your managers",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.s04,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

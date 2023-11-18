import 'package:aubilous/components/ab_select_button.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class LanguageSelector extends StatelessWidget {
  const LanguageSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        AbSelectButton(
          text: "English",
          onTap: () {},
          selected: true,
        ),
        const SizedBox(width: AppSizes.s02),
        AbSelectButton(
          text: "Portuguese",
          onTap: () {},
        ),
      ],
    );
  }
}

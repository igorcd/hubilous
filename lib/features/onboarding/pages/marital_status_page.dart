import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class MaritalStatusPage extends StatelessWidget {
  final void Function() onSelect;
  const MaritalStatusPage({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s07),
      children: [
        Text(
          "What is your origin country?",
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: AppSizes.s12),
        AbButton(
          content: "Married",
          onTap: onSelect,
          outline: true,
        ),
        const SizedBox(height: AppSizes.s03),
        AbButton(
          content: "Single",
          onTap: onSelect,
          outline: true,
        ),
      ],
    );
  }
}

import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class ChildrenPage extends StatelessWidget {
  final void Function() onSelect;
  const ChildrenPage({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s07),
      children: [
        Text(
          "Do you have children?",
          style: textTheme.displaySmall,
        ),
        const SizedBox(height: AppSizes.s12),
        AbButton(
          content: "Yes",
          onTap: onSelect,
          outline: true,
        ),
        const SizedBox(height: AppSizes.s03),
        AbButton(
          content: "No",
          onTap: onSelect,
          outline: true,
        ),
      ],
    );
  }
}

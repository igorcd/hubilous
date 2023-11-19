import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbDrawerListTile extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const AbDrawerListTile({required this.label, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSizes.s06,
      ),
      onTap: () {
        Scaffold.of(context).closeDrawer();
        onTap();
      },
      title: Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbTextButton extends StatelessWidget {
  final void Function() onTap;
  final String text;
  const AbTextButton({required this.onTap, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppSizes.s01),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.s00_5, vertical: AppSizes.s00_5),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: AppSizes.s03,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

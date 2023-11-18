import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbSelectButton extends StatelessWidget {
  final String text;
  final bool selected;
  final void Function() onTap;
  const AbSelectButton({this.selected = false, required this.text, required this.onTap, super.key});

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
          decoration: BoxDecoration(
            border: selected ? const Border(bottom: BorderSide(color: Colors.white)) : null,
          ),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: AppSizes.s03,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

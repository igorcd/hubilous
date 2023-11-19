import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbSearchInput extends StatelessWidget {
  final void Function(String value) onChanged;
  const AbSearchInput({required this.onChanged, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s02),
      height: AppSizes.s11,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(999)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppIcons.search,
            width: AppSizes.s06,
            color: Colors.grey.shade800,
          ),
          const SizedBox(width: AppSizes.s02),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: AppSizes.s04_5,
                height: 1,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search...",
                isDense: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbBotInput extends StatelessWidget {
  final TextEditingController controller;
  final void Function() onSubmit;

  const AbBotInput({required this.controller, required this.onSubmit, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s04),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(999)),
            child: TextField(
              minLines: 1,
              maxLines: 4,
              style: const TextStyle(
                fontSize: AppSizes.s04,
                fontWeight: FontWeight.normal,
                height: 1.3,
              ),
              controller: controller,
              decoration: const InputDecoration(border: InputBorder.none, hintText: "Type your question..."),
            ),
          ),
        ),
        const SizedBox(width: AppSizes.s02),
        Container(
          height: AppSizes.s12,
          width: AppSizes.s12,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onSubmit,
              child: Center(
                child: Image.asset(
                  AppIcons.send,
                  width: AppSizes.s06,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

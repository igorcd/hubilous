import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbBotButton extends StatelessWidget {
  final String value;
  final String buttonValue;
  final void Function() onTap;
  const AbBotButton({required this.value, required this.buttonValue, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: value.isNotEmpty,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 150),
        opacity: value.isNotEmpty && value != buttonValue ? .5 : 1,
        child: Material(
          borderRadius: BorderRadius.circular(AppSizes.s02),
          color: Colors.grey.shade300,
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s03, vertical: AppSizes.s02),
              child: Text(
                buttonValue,
                style: TextStyle(color: Colors.grey.shade800, fontWeight: FontWeight.w600, fontSize: AppSizes.s03_5),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AbBotSelect extends StatelessWidget {
  final String value;
  final List<String> options;
  final void Function(String value) onSelect;

  const AbBotSelect({required this.value, required this.options, required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSizes.s01),
      child: Wrap(
        alignment: WrapAlignment.end,
        spacing: AppSizes.s01_5,
        runSpacing: AppSizes.s01_5,
        children: options
            .map(
              (e) => AbBotButton(
                value: value,
                buttonValue: e,
                onTap: () => onSelect(e),
              ),
            )
            .toList(),
      ),
    );
  }
}

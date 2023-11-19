import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class PinPage extends StatelessWidget {
  final void Function() onContinue;
  const PinPage({required this.onContinue, super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s07),
            children: [
              Text(
                "Please, insert the code that you received in your email",
                style: textTheme.displaySmall,
              ),
              const SizedBox(height: AppSizes.s10),
              TextField(
                style: const TextStyle(
                  fontSize: AppSizes.s09,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(color: Colors.white.withOpacity(.7)),
                  hintText: "Ex.: 123456",
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: AppSizes.s07,
            right: AppSizes.s07,
            bottom: AppSizes.s07,
          ),
          child: AbButton(
            content: "Continue",
            onTap: onContinue,
          ),
        )
      ],
    );
  }
}

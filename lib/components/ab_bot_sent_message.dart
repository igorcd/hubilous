import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbBotSentMessage extends StatelessWidget {
  final String message;
  const AbBotSentMessage(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSizes.s01_5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: constraints.maxWidth * .9),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.s04,
                  vertical: AppSizes.s03,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(AppSizes.s05),
                    bottomLeft: Radius.circular(AppSizes.s05),
                    bottomRight: Radius.circular(AppSizes.s05),
                  ),
                ),
                child: Text(
                  message,
                  style: TextStyle(color: Colors.grey.shade700, height: 1.2, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

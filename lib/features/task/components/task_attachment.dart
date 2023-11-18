import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/core/models/attachment_model.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class TaskAttachment extends StatelessWidget {
  final AttachmentModel attachment;
  const TaskAttachment(this.attachment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade100, width: 2),
        borderRadius: BorderRadius.circular(AppSizes.s03),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s02, vertical: AppSizes.s00_5),
            child: Row(
              children: [
                Image.asset(
                  AppIcons.document,
                  width: AppSizes.s06,
                ),
                const SizedBox(width: AppSizes.s01),
                Expanded(
                  child: Text(
                    "${attachment.extension} • ${attachment.size}kb",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.shade900),
                  ),
                ),
                AbIconButton(
                  onPressed: () {},
                  icon: AppIcons.download,
                  size: AppSizes.s09,
                  iconSize: AppSizes.s06,
                ),
              ],
            ),
          ),
          Divider(thickness: 2, height: 2, color: Colors.grey.shade100),
          Padding(
            padding: const EdgeInsets.all(AppSizes.s02),
            child: Text(attachment.name),
          ),
        ],
      ),
    );
  }
}

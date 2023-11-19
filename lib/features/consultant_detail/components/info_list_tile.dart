import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class InfoListTile extends StatelessWidget {
  final String icon;
  final String label;
  final String content;
  const InfoListTile({
    required this.icon,
    required this.label,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSizes.s02, vertical: AppSizes.s02_5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon, color: Colors.white, width: AppSizes.s05),
          const SizedBox(width: AppSizes.s03),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  content,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: AppSizes.s04,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

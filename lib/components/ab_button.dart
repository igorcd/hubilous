import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbButton extends StatelessWidget {
  final void Function() onTap;
  final String content;
  final bool outline;
  const AbButton({this.outline = false, required this.content, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.s12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: outline ? Border.all(color: Colors.white, width: 2) : null,
        color: outline ? Colors.transparent : Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Center(
            child: Text(
              content,
              style: TextStyle(
                color: outline ? Colors.white : Colors.grey.shade800,
                fontWeight: FontWeight.w600,
                fontSize: AppSizes.s04,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

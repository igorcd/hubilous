import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbIconButton extends StatelessWidget {
  final void Function() onPressed;
  final Color? color;
  final double size;
  final double iconSize;
  final String icon;

  const AbIconButton({
    this.size = AppSizes.s12,
    this.iconSize = AppSizes.s08,
    required this.onPressed,
    required this.icon,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(999))),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Image.asset(
              icon,
              fit: BoxFit.contain,
              height: iconSize,
              width: iconSize,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_images.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbBotButton extends StatefulWidget {
  final bool isManager;
  final void Function() onTap;
  final String message;
  const AbBotButton({required this.message, this.isManager = false, required this.onTap, super.key});

  @override
  State<AbBotButton> createState() => _AbBotButtonState();
}

class _AbBotButtonState extends State<AbBotButton> {
  bool messageHidden = false;

  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () => {
        if (mounted) {setState(() => messageHidden = true)}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.s05,
          vertical: AppSizes.s06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IgnorePointer(
              child: AnimatedOpacity(
                opacity: messageHidden ? 0 : 1,
                duration: const Duration(milliseconds: 150),
                child: AnimatedSlide(
                  duration: const Duration(milliseconds: 150),
                  offset: messageHidden ? const Offset(0, -0.1) : Offset.zero,
                  child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(bottom: AppSizes.s03),
                    padding: const EdgeInsets.symmetric(horizontal: AppSizes.s04, vertical: AppSizes.s03),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.s04),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.6),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Aubot",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: widget.isManager ? AppColors.accent : AppColors.primary,
                          ),
                        ),
                        Text(
                          widget.message,
                          style: const TextStyle(
                            height: 1.2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Bot Button
            Container(
              width: AppSizes.s14,
              height: AppSizes.s14,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.6),
                    blurRadius: 10,
                  )
                ],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(999),
                  topRight: Radius.circular(999),
                  bottomLeft: Radius.circular(999),
                ),
              ),
              clipBehavior: Clip.hardEdge,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: widget.onTap,
                  child: Center(
                    child: Image.asset(
                      AppImages.logo,
                      color: widget.isManager ? AppColors.accent : AppColors.primary,
                      width: AppSizes.s12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

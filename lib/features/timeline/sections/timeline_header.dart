import 'dart:ui';
import 'package:aubilous/features/timeline/components/language_selector.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class TimelineHeader extends StatelessWidget {
  const TimelineHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Container(
      padding: EdgeInsets.only(
        top: mediaQuery.padding.top + AppSizes.s04,
        left: AppSizes.s05,
        right: AppSizes.s05,
        bottom: mediaQuery.padding.bottom + AppSizes.s04,
      ),
      height: 210,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "WELCOME",
                  style: TextStyle(
                    fontSize: AppSizes.s05,
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  "Aubilous",
                  style: TextStyle(
                    fontSize: AppSizes.s09,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: AppSizes.s05_5),
                const Text(
                  "This is the next steps that you need to do to join us.",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Positioned(
            top: -(MediaQuery.of(context).padding.top + 30),
            right: -40,
            child: IgnorePointer(
              ignoring: true,
              child: BackdropFilter(
                filter: ImageFilter.blur(),
                blendMode: BlendMode.overlay,
                child: Opacity(
                  opacity: .8,
                  child: Image.asset(
                    "lib/assets/images/logo.png",
                    width: 300,
                    colorBlendMode: BlendMode.overlay,
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: LanguageSelector(),
          ),
        ],
      ),
    );
  }
}

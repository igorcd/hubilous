import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnbaordingFinishPage extends StatelessWidget {
  const OnbaordingFinishPage({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AbGradientContainer(
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Opacity(
                  opacity: .6,
                  child: SizedBox(
                    width: double.infinity,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Lottie.asset(
                        "lib/assets/lottie/fireworks.json",
                        animate: true,
                        repeat: true,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.s07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Congratulations!",
                        style: textTheme.displayLarge,
                      ),
                      const SizedBox(height: AppSizes.s04),
                      Text(
                        "You are offioally an Aubiolous",
                        style: textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.s12),
                      const Text(
                        "We hope that you will have a good stay with us.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: AppSizes.s04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSizes.s12),
                      AbButton(
                        content: "Continue",
                        onTap: () => Navigator.of(context).pushNamed(AppRouter.timelineFeature),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

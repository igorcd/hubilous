import 'package:aubilous/components/aB_gradient_container.dart';
import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class WelcomeFeature extends StatelessWidget {
  const WelcomeFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbGradientContainer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppSizes.s07),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "HUBiolous",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppSizes.s10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: AppSizes.s03),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.s02),
                  child: Text(
                    "The track solution for joining employees for Aubay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.s04,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: double.infinity,
                  constraints: const BoxConstraints(maxHeight: 160),
                ),
                AbButton(
                  onTap: () => Navigator.of(context).pushNamed(AppRouter.authenticationFeature),
                  content: "I’m consultant",
                  outline: true,
                ),
                const SizedBox(height: AppSizes.s02),
                AbButton(
                  onTap: () => Navigator.of(context).pushNamed(AppRouter.authenticationFeature, arguments: true),
                  content: "I’m manager",
                  outline: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/components/ab_onboarding_indicators.dart';
import 'package:aubilous/features/onboarding/pages/children_page.dart';
import 'package:aubilous/features/onboarding/pages/country_page.dart';
import 'package:aubilous/features/onboarding/pages/marital_status_page.dart';
import 'package:aubilous/features/onboarding/pages/onboarding_finished_page.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class OnboardingFeature extends StatefulWidget {
  const OnboardingFeature({super.key});

  @override
  State<OnboardingFeature> createState() => _OnboardingFeatureState();
}

class _OnboardingFeatureState extends State<OnboardingFeature> {
  final pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: AbGradientContainer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: AppSizes.s07,
                  right: AppSizes.s07,
                  top: AppSizes.s07,
                  bottom: AppSizes.s02,
                ),
                child: Text(
                  'Let\'s complete some informations',
                  style: textTheme.displayMedium,
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageControler,
                  children: [
                    CountryPage(
                      onSelect: () => pageControler.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.ease,
                      ),
                    ),
                    MaritalStatusPage(
                      onSelect: () => pageControler.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.ease,
                      ),
                    ),
                    ChildrenPage(
                      onSelect: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const OnbaordingFinishPage()),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.s07),
                child: AnimatedBuilder(
                  animation: pageControler,
                  builder: (context, child) => AbOnboardingIndicators(
                    index: pageControler.page?.round() ?? 0,
                    length: 3,
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

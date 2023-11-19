import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/features/authentication/pages/login_page.dart';
import 'package:aubilous/features/authentication/pages/pin_page.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class AuthenticationFeature extends StatefulWidget {
  const AuthenticationFeature({super.key});

  @override
  State<AuthenticationFeature> createState() => _AuthenticationFeatureState();
}

class _AuthenticationFeatureState extends State<AuthenticationFeature> {
  final pageControler = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbGradientContainer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.s07,
                  right: AppSizes.s07,
                  top: AppSizes.s07,
                ),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: AppSizes.s09,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageControler,
                  children: [
                    LoginPage(
                      onContinue: () => pageControler.animateToPage(1,
                          duration: const Duration(milliseconds: 300), curve: Curves.ease),
                    ),
                    PinPage(
                      onContinue: () => Navigator.of(context).pushNamed(AppRouter.onboardingFeature),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

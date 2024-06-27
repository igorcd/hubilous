import 'package:aubilous/core/models/consultant_model.dart';
import 'package:aubilous/features/authentication/authentication_feature.dart';
import 'package:aubilous/features/bot/bot_feature.dart';
import 'package:aubilous/features/consultant_detail/consultant_detail_feature.dart';
import 'package:aubilous/features/faq/faq_feature.dart';
import 'package:aubilous/features/manager_bot/manager_bot_feature.dart';
import 'package:aubilous/features/manager_dashboard/manager_dashboard_feature.dart';
import 'package:aubilous/features/manager_detail/manager_detail_feature.dart';
import 'package:aubilous/features/onboarding/onboarding_feature.dart';
import 'package:aubilous/features/task/task_feature.dart';
import 'package:aubilous/features/timeline/timeline_feature.dart';
import 'package:aubilous/features/welcome/welcome_feature.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String welcomeFeature = "WELCOME_FEATURE";
  static const String timelineFeature = "TIMELINE_FEATURE";
  static const String taskFeature = "TASK_DETAIL";
  static const String authenticationFeature = "AUTHENTICATION_FEATURE";
  static const String onboardingFeature = "ONBOARDING_FEATURE";
  static const String managerDashboardFeature = "MANAGER_DASHBOARD_FEATURE";
  static const String consultantDetailFeature = "CONSULTANT_DETAIL_FEATURE";
  static const String managerDetailFeature = "MANAGER_DETAIL";
  static const String faqFeature = "FAQ";
  static const String botFeature = "BOT";
  static const String managerBotFeature = "MANAGER_BOT";

  static PageRouteBuilder _modalView(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (c, _, __) => page,
      transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
        var curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.ease);
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        var tween = Tween(begin: begin, end: end);

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static Route<dynamic> controller(RouteSettings settings) {
    switch (settings.name) {
      case authenticationFeature:
        return MaterialPageRoute(builder: (context) => AuthenticationFeature(settings.arguments as bool? ?? false));

      case welcomeFeature:
        return MaterialPageRoute(builder: (context) => const WelcomeFeature());

      case timelineFeature:
        return MaterialPageRoute(builder: (context) => const TimelineFeature());

      case onboardingFeature:
        return MaterialPageRoute(builder: (context) => const OnboardingFeature());

      case managerDashboardFeature:
        return MaterialPageRoute(builder: (context) => const ManagerDashboardFeature());

      case managerDetailFeature:
        return MaterialPageRoute(builder: (context) => const ManagerDetailFeature());

      case faqFeature:
        return MaterialPageRoute(builder: (context) => const FaqFeature());

      case botFeature:
        return MaterialPageRoute(builder: (context) => const BotFeature());

      case managerBotFeature:
        return MaterialPageRoute(builder: (context) => const ManagerBotFeature());

      case taskFeature:
        return _modalView(TaskFeature(settings.arguments as bool? ?? false));

      case consultantDetailFeature:
        return _modalView(ConsultantDetailFeature(settings.arguments as ConsultantModel));

      default:
        throw "Rota inválida";
    }
  }
}

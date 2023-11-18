import 'package:aubilous/features/task/task_feature.dart';
import 'package:aubilous/features/timeline/timeline_feature.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const String timelineFeature = "TIMELINE_FEATURE";
  static const String taskFeature = "TASK_DETAIL";

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
      // timeline
      case timelineFeature:
        return MaterialPageRoute(builder: (context) => const TimelineFeature());

      // task feature
      case taskFeature:
        return _modalView(const TaskFeature());

      default:
        throw "Rota inválida";
    }
  }
}

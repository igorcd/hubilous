import 'dart:async';

import 'package:flutter/material.dart';

class AbAppearAnimation extends StatefulWidget {
  final Widget child;
  const AbAppearAnimation({required this.child, super.key});

  @override
  State<AbAppearAnimation> createState() => _AbAppearAnimationState();
}

class _AbAppearAnimationState extends State<AbAppearAnimation> {
  bool appear = false;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 50), () {
      setState(() {
        appear = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: appear ? 1 : 0,
      duration: const Duration(milliseconds: 150),
      child: widget.child,
    );
  }
}

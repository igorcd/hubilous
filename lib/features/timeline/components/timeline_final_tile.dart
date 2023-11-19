import 'package:aubilous/components/ab_dashed_line.dart';
import 'package:flutter/material.dart';

class TimelineFinalTile extends StatelessWidget {
  const TimelineFinalTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).padding.bottom + 100,
      child: const Stack(
        children: [
          Positioned(
            top: -6,
            bottom: 0,
            left: 36,
            width: 1.5,
            child: AbDashedLine(),
          ),
        ],
      ),
    );
  }
}

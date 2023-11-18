import 'package:flutter/material.dart';

class AbDashedLine extends StatelessWidget {
  final bool horizontal;
  const AbDashedLine({this.horizontal = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: horizontal ? 1.5 : null,
      width: horizontal ? null : 1.5,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var ticks = horizontal ? (constraints.maxWidth / 12).floor() : (constraints.maxHeight / 12).floor();
          return Flex(
            direction: horizontal ? Axis.horizontal : Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              ticks,
              (index) => Container(
                color: Colors.grey.shade300,
                height: horizontal ? double.infinity : 8,
                width: horizontal ? 8 : double.infinity,
              ),
            ),
          );
        },
      ),
    );
  }
}

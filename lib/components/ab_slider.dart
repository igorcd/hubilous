import 'package:aubilous/resourses/app_gradients.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbSlider extends StatefulWidget {
  final bool completed;
  final double height;
  final double minWidth;
  final void Function() onComplete;
  final double iconSize;
  const AbSlider({required this.completed, this.height = AppSizes.s09, this.iconSize = AppSizes.s04_5, this.minWidth = 55, required this.onComplete, super.key});

  @override
  State<AbSlider> createState() => _AbSliderState();
}

class _AbSliderState extends State<AbSlider> {
  double initialPosition = 0;
  double delta = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.height / 2),
        color: Colors.grey.shade200,
      ),
      child: LayoutBuilder(
        builder: (p0, p1) {
          return Stack(
            children: [
              // Texto
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: widget.minWidth * 0.7),
                  child: const Text(
                    "slide to complete",
                    style: TextStyle(
                      fontSize: AppSizes.s03,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),

              // Slider
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 50),
                  height: AppSizes.s09,
                  width: widget.completed ? double.infinity : widget.minWidth + delta,
                  constraints: BoxConstraints(minWidth: widget.minWidth, maxWidth: p1.maxWidth),
                  decoration: BoxDecoration(
                    gradient: AppGradients.primary,
                    borderRadius: BorderRadius.circular(AppSizes.s09),
                  ),

                  // Deteção da diferença
                  child: GestureDetector(
                    onPanStart: (details) => initialPosition = details.globalPosition.dx,
                    onPanUpdate: (details) {
                      if (!widget.completed) {
                        setState(() {
                          delta = details.globalPosition.dx - initialPosition;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      if (delta + widget.minWidth >= p1.maxWidth) {
                        widget.onComplete();
                      }
                      setState(() => delta = 0);
                    },
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      switchInCurve: const Interval(.6, 1, curve: Curves.ease),
                      switchOutCurve: const Interval(.6, 1, curve: Curves.ease),
                      child: widget.completed
                          ? const Center(
                              child: Text(
                                "Completed",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                              ),
                            )
                          : Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: widget.minWidth * 0.35),
                                child: Image.asset(
                                  AppIcons.arrowRight,
                                  width: widget.iconSize,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

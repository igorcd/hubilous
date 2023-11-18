import 'package:aubilous/components/ab_dashed_line.dart';
import 'package:aubilous/components/ab_slider.dart';
import 'package:aubilous/components/ab_text.dart';
import 'package:aubilous/core/models/task_list_model.dart';
import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class TimelineTile extends StatelessWidget {
  final bool isFirst;
  final bool active;
  final void Function() onComplete;
  final TaskListModel task;
  const TimelineTile(this.task, {required this.onComplete, required this.active, required this.isFirst, super.key});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !active,
      child: Container(
        padding: const EdgeInsets.only(left: AppSizes.s05, right: AppSizes.s05),
        height: 180,
        child: Stack(
          children: [
            // Linha inferior
            Positioned(
              top: isFirst ? 56 : 0,
              bottom: 0,
              left: AppSizes.s04,
              width: 1.5,
              child: const AbDashedLine(),
            ),

            // Conteúdo
            Positioned.fill(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ícone
                  Container(
                    width: AppSizes.s08,
                    height: AppSizes.s08,
                    margin: const EdgeInsets.only(top: AppSizes.s06),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(AppSizes.s04),
                    ),
                    child: Image.asset(
                      task.icon,
                      width: AppSizes.s06,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: AppSizes.s03),

                  // Conteúdo
                  Expanded(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 600),
                      opacity: active ? 1 : .5,
                      child: Container(
                        margin: const EdgeInsets.only(bottom: AppSizes.s05),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppSizes.s06),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Padding(
                          padding: const EdgeInsets.all(AppSizes.s03_5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(AppRouter.taskFeature);
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      //
                                      // Título
                                      AbText.titleMedium(
                                        task.title,
                                      ),
                                      const SizedBox(height: AppSizes.s02),

                                      // Conteúdo
                                      Expanded(
                                        child: AbText(
                                          task.description,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: AppSizes.s02),
                              Row(
                                children: [
                                  Expanded(
                                    child: AbSlider(
                                      completed: task.complete,
                                      onComplete: onComplete,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

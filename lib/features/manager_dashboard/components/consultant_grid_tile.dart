import 'package:aubilous/core/models/consultant_model.dart';
import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class ConsultantGridTile extends StatelessWidget {
  final ConsultantModel consultant;
  final void Function() onTap;
  const ConsultantGridTile({required this.consultant, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppSizes.s02)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              consultant.picture,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.7),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(
                AppSizes.s02_5,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              consultant.name,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                            Text(
                              consultant.city,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        "lib/assets/flags/${consultant.country}.png",
                        width: AppSizes.s06,
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              "Client:",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              consultant.client,
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      if (consultant.stepsDone != consultant.totalSteps)
                        SizedBox(
                          width: AppSizes.s10,
                          height: AppSizes.s10,
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  color: AppColors.accent,
                                  value: consultant.stepsDone / consultant.totalSteps,
                                ),
                              ),
                              Center(
                                child: Text(
                                  "${consultant.stepsDone}/${consultant.totalSteps}",
                                  style:
                                      const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned.fill(
              child: Material(
            color: Colors.transparent,
            child: InkWell(onTap: onTap),
          ))
        ],
      ),
    );
  }
}

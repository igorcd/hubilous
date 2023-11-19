import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/core/models/consultant_model.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class ConsultantDetailHeader extends StatelessWidget {
  final ConsultantModel consultant;
  const ConsultantDetailHeader(this.consultant, {super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.s04,
          vertical: AppSizes.s02,
        ),
        child: Column(
          children: [
            Row(
              children: [
                AbIconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: AppIcons.angleLeft,
                  size: AppSizes.s10,
                  iconSize: AppSizes.s10,
                ),
              ],
            ),
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(999),
                image: DecorationImage(
                  image: AssetImage(consultant.picture),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.s02),
            Text(
              consultant.name,
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSizes.s02),
            Text(
              "${consultant.city} - ${consultant.country.toUpperCase()}",
              style: const TextStyle(
                color: Colors.white,
                fontSize: AppSizes.s04,
              ),
            ),
            const SizedBox(height: AppSizes.s02),
          ],
        ),
      ),
    );
  }
}

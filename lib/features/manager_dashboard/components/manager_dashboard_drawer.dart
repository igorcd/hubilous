import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class ManagerDashboardDrawer extends StatelessWidget {
  const ManagerDashboardDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(AppSizes.s06),
              child: Text(
                "HUBiolous",
                style: TextStyle(
                  color: AppColors.accent,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.s06,
                ),
              ),
            ),
            const Spacer(),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: AppSizes.s06,
              ),
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.welcomeFeature,
                (route) => false,
              ),
              title: const Text(
                "Sair",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.accent,
                ),
              ),
            ),
            const SizedBox(
              height: AppSizes.s10,
            )
          ],
        ),
      ),
    );
  }
}

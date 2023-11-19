import 'package:aubilous/components/ab_drawer_list_tile.dart';
import 'package:aubilous/resourses/app_colors.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class ConsultantDashboardDrawer extends StatelessWidget {
  const ConsultantDashboardDrawer({super.key});

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
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.s06,
                ),
              ),
            ),
            AbDrawerListTile(
              label: "My manager",
              onTap: () => Navigator.of(context).pushNamed(AppRouter.managerDetailFeature),
            ),
            AbDrawerListTile(
              label: "FAQ",
              onTap: () => Navigator.of(context).pushNamed(AppRouter.faqFeature),
            ),
            const Spacer(),
            AbDrawerListTile(
              label: "Sair",
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil(
                AppRouter.welcomeFeature,
                (route) => false,
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

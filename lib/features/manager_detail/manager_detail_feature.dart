import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/features/consultant_detail/components/info_list_tile.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class ManagerDetailFeature extends StatelessWidget {
  const ManagerDetailFeature({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return AbGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: AbIconButton(
            icon: AppIcons.angleLeft,
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: false,
          titleSpacing: 0,
          title: const Text(
            "Manager",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(AppSizes.s06),
            children: [
              Center(
                child: Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    image: const DecorationImage(
                      image: AssetImage("lib/assets/images/avatars/9.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.s02),
              Text(
                "Leonardo Paulo",
                style: textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.s10),
              const Divider(height: 1),
              const InfoListTile(
                icon: AppIcons.email,
                content: "leonardo.paulo@aubay.pt",
                label: "E-mail",
              ),
              const Divider(height: 1),
              const InfoListTile(
                icon: AppIcons.phone,
                content: "978 123 456",
                label: "Phone",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

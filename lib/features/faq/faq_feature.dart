import 'package:aubilous/components/ab_button.dart';
import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';

class FaqFeature extends StatelessWidget {
  const FaqFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> faq = [
      {
        "title": "Lorem ipsum",
        "content":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
      },
      {
        "title": "Lorem ipsum",
        "content":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
      },
      {
        "title": "Lorem ipsum",
        "content":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
      },
      {
        "title": "Lorem ipsum",
        "content":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled"
      },
    ];

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
            "FAQ",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: faq.length,
                  padding: const EdgeInsets.all(AppSizes.s06),
                  separatorBuilder: (c, i) => const SizedBox(height: AppSizes.s02),
                  itemBuilder: (c, i) => ExpansionTile(
                    expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
                    title: Text(faq[i]["title"] as String),
                    collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.s02)),
                    collapsedBackgroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSizes.s02),
                    ),
                    clipBehavior: Clip.hardEdge,
                    childrenPadding: const EdgeInsets.only(
                      left: AppSizes.s04,
                      right: AppSizes.s04,
                      bottom: AppSizes.s04,
                    ),
                    children: [
                      Text(faq[i]["content"] as String),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppSizes.s06),
                child: AbButton(
                  content: "I have another question",
                  onTap: () => Navigator.of(context).pushNamed(AppRouter.botFeature),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

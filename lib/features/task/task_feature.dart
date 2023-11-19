import 'dart:ui';
import 'package:aubilous/components/ab_checkbox_list_tile.dart';
import 'package:aubilous/components/ab_icon_button.dart';
import 'package:aubilous/components/ab_slider.dart';
import 'package:aubilous/features/task/components/task_attachment.dart';
import 'package:aubilous/features/task/components/task_header.dart';
import 'package:aubilous/features/task/components/task_image.dart';
import 'package:aubilous/resourses/app_gradients.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:aubilous/mock/task_detail.dart' as task_detail;

class TaskFeature extends StatefulWidget {
  const TaskFeature({super.key});

  @override
  State<TaskFeature> createState() => _TaskFeatureState();
}

class _TaskFeatureState extends State<TaskFeature> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      // Estilização
      body: Container(
        decoration: BoxDecoration(gradient: AppGradients.primary),
        child: Stack(
          children: [
            //
            // Logo
            Positioned(
              top: -(MediaQuery.of(context).padding.top + 30),
              right: -40,
              child: IgnorePointer(
                ignoring: true,
                child: BackdropFilter(
                  filter: ImageFilter.blur(),
                  blendMode: BlendMode.overlay,
                  child: Opacity(
                    opacity: .8,
                    child: Image.asset(
                      "lib/assets/images/logo.png",
                      width: 300,
                      colorBlendMode: BlendMode.overlay,
                    ),
                  ),
                ),
              ),
            ),

            Positioned.fill(
              child: SafeArea(
                bottom: false,
                child: NestedScrollView(
                  //
                  // Conteúdo do Header
                  headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        backgroundColor: Colors.transparent,
                        expandedHeight: 170 - kToolbarHeight,
                        pinned: true,
                        floating: false,
                        elevation: 0,
                        surfaceTintColor: Colors.transparent,
                        leading: Center(
                          child: AbIconButton(onPressed: () => Navigator.of(context).pop(), icon: AppIcons.angleLeft),
                        ),
                        flexibleSpace: TaskHeader(
                          title: task_detail.taskDetail.title,
                        ),
                      ),
                    ];
                  },
                  body: Padding(
                    padding: const EdgeInsets.only(top: kToolbarHeight),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(AppSizes.s06)),
                      ),
                      child: ListView(
                        padding: const EdgeInsets.only(top: AppSizes.s05, bottom: AppSizes.s20),
                        children: [
                          //
                          // Description
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s05),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text("Description", style: textTheme.titleMedium),
                                const SizedBox(height: AppSizes.s02),
                                Text(
                                  task_detail.taskDetail.description,
                                ),
                                const Divider(),
                              ],
                            ),
                          ),

                          // Imagens
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s05),
                            child: Text(
                              "Images",
                              style: textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: AppSizes.s04),
                          SizedBox(
                            height: 160,
                            child: ListView.separated(
                              padding: const EdgeInsets.symmetric(horizontal: AppSizes.s05),
                              scrollDirection: Axis.horizontal,
                              itemCount: task_detail.taskDetail.images.length,
                              separatorBuilder: (context, index) => const SizedBox(width: AppSizes.s03_5),
                              itemBuilder: (context, index) {
                                return TaskImage(task_detail.taskDetail.images[index]);
                              },
                            ),
                          ),
                          const Divider(indent: AppSizes.s05, endIndent: AppSizes.s05),

                          // Required documents
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s05),
                            child: Text(
                              "Check-list",
                              style: textTheme.titleMedium,
                            ),
                          ),
                          const SizedBox(height: AppSizes.s02),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: task_detail.taskDetail.toDos.length,
                            itemBuilder: (context, index) {
                              var todo = task_detail.taskDetail.toDos[index];
                              return AbCheckboxListTile(
                                todo,
                                onComplete: (value) => setState(() => todo.checked = value),
                              );
                            },
                          ),

                          const Divider(indent: AppSizes.s05, endIndent: AppSizes.s05),

                          // Attachments
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSizes.s05),
                            child: Text(
                              "Attachments",
                              style: textTheme.titleMedium,
                            ),
                          ),
                          ListView.separated(
                            padding: const EdgeInsets.all(AppSizes.s05),
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: task_detail.taskDetail.attachments.length,
                            shrinkWrap: true,
                            separatorBuilder: (c, i) => const SizedBox(height: AppSizes.s03_5),
                            itemBuilder: (c, i) {
                              var attachment = task_detail.taskDetail.attachments[i];
                              return TaskAttachment(attachment);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Slider
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(AppSizes.s03_5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSizes.s09)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 16,
                        offset: const Offset(0, -4),
                      ),
                    ]),
                child: AbSlider(
                  height: AppSizes.s12_5,
                  minWidth: AppSizes.s17,
                  iconSize: AppSizes.s06,
                  completed: task_detail.taskDetail.completed,
                  onComplete: () => setState(() => task_detail.taskDetail.completed = true),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

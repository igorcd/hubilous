import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/core/models/consultant_model.dart';
import 'package:aubilous/features/consultant_detail/components/consultant_detail_header.dart';
import 'package:aubilous/features/consultant_detail/components/info_list_tile.dart';
import 'package:aubilous/features/timeline/components/timeline_tile.dart';
import 'package:aubilous/resourses/app_icons.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:aubilous/mock/task_list.dart' as task_list_mock;

class ConsultantDetailFeature extends StatefulWidget {
  final ConsultantModel consultant;
  const ConsultantDetailFeature(this.consultant, {super.key});

  @override
  State<ConsultantDetailFeature> createState() => _ConsultantDetailFeatureState();
}

class _ConsultantDetailFeatureState extends State<ConsultantDetailFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AbGradientContainer(
        theme: GradientTheme.blue,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: ConsultantDetailHeader(widget.consultant)),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: AppSizes.s06,
                right: AppSizes.s06,
                bottom: AppSizes.s03,
              ),
              sliver: SliverList.list(
                children: [
                  const Divider(height: 1),
                  InfoListTile(
                    icon: AppIcons.user,
                    content: widget.consultant.manager,
                    label: "Manager",
                  ),
                  const Divider(height: 1),
                  InfoListTile(
                    icon: AppIcons.company,
                    content: widget.consultant.client,
                    label: "Client",
                  ),
                  const Divider(height: 1),
                  InfoListTile(
                    icon: AppIcons.email,
                    content: widget.consultant.email,
                    label: "E-mail",
                  ),
                  const Divider(height: 1),
                  InfoListTile(
                    icon: AppIcons.phone,
                    content: widget.consultant.phone,
                    label: "Phone",
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var task = task_list_mock.tasks[index];
                  var prevTask = index == 0 ? null : task_list_mock.tasks[index - 1];
                  return TimelineTile(
                    task,
                    onTap: () => Navigator.of(context).pushNamed(AppRouter.taskFeature, arguments: true),
                    theme: GradientTheme.blue,
                    isFirst: index == 0,
                    active: prevTask == null || prevTask.complete == true || task.complete,
                    onComplete: () => setState(() => task_list_mock.tasks[index].complete = true),
                  );
                },
                childCount: task_list_mock.tasks.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}

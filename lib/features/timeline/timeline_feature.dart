import 'package:aubilous/components/ab_bot_button.dart';
import 'package:aubilous/components/ab_gradient_container.dart';
import 'package:aubilous/features/timeline/components/consultant_dashboard_drawer.dart';
import 'package:aubilous/features/timeline/components/consultant_dashboard_header.dart';
import 'package:aubilous/features/timeline/components/timeline_final_tile.dart';
import 'package:aubilous/features/timeline/components/timeline_tile.dart';
import 'package:aubilous/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:aubilous/mock/task_list.dart' as task_list_mock;

class TimelineFeature extends StatefulWidget {
  const TimelineFeature({super.key});

  @override
  State<TimelineFeature> createState() => _TimelineFeatureState();
}

class _TimelineFeatureState extends State<TimelineFeature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const ConsultantDashboardDrawer(),
      body: AbGradientContainer(
        child: Stack(
          children: [
            Positioned.fill(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: ConsultantDashboardHeader(),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var task = task_list_mock.tasks[index];
                        var prevTask = index == 0 ? null : task_list_mock.tasks[index - 1];
                        return TimelineTile(
                          task,
                          onTap: () => Navigator.of(context).pushNamed(AppRouter.taskFeature),
                          isFirst: index == 0,
                          active: prevTask == null || prevTask.complete == true || task.complete,
                          onComplete: () => setState(() => task_list_mock.tasks[index].complete = true),
                        );
                      },
                      childCount: task_list_mock.tasks.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: TimelineFinalTile(),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: AbBotButton(
                onTap: () => Navigator.of(context).pushNamed(AppRouter.botFeature),
                message: "Hello Aubilous, I'm your personal assistantant, if you have any doubt, just click here",
              ),
            )
          ],
        ),
      ),
    );
  }
}

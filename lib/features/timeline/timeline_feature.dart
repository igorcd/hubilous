import 'package:aubilous/features/timeline/components/timeline_tile.dart';
import 'package:aubilous/features/timeline/sections/timeline_header.dart';
import 'package:aubilous/resourses/app_colors.dart';
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
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: const Alignment(-0.8, -0.8),
            radius: 1,
            colors: [
              AppColors.primary,
              AppColors.primary.shade600,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: TimelineHeader(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var task = task_list_mock.tasks[index];
                  var prevTask = index == 0 ? null : task_list_mock.tasks[index - 1];
                  return TimelineTile(
                    task,
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

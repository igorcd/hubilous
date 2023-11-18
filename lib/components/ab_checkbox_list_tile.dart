import 'package:aubilous/core/models/todo_model.dart';
import 'package:aubilous/resourses/app_sizes.dart';
import 'package:flutter/material.dart';

class AbCheckboxListTile extends StatelessWidget {
  final TodoModel todo;
  final void Function(bool value) onComplete;
  const AbCheckboxListTile(this.todo, {required this.onComplete, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.s13,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onComplete(!todo.checked),
          child: Padding(
            padding: const EdgeInsets.only(left: AppSizes.s02, right: AppSizes.s05),
            child: Row(
              children: [
                Checkbox(value: todo.checked, onChanged: (value) => onComplete(!todo.checked)),
                Expanded(
                  child: Text(todo.title),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:aubilous/core/models/attachment_model.dart';
import 'package:aubilous/core/models/todo_model.dart';

class TaskDetailModel {
  final String title;
  final String description;
  final List<String> images;
  final String toDoTitle;
  final List<TodoModel> toDos;
  final List<AttachmentModel> attachments;
  bool completed;

  TaskDetailModel({
    required this.title,
    required this.description,
    required this.images,
    required this.toDoTitle,
    required this.toDos,
    required this.attachments,
    required this.completed,
  });
}

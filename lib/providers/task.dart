import 'package:tasks/models/task.dart';

class TaskProvider {
  Future<List<TaskModel>> getTasks() async {
    final List<TaskModel> tasks = List.filled(
      5,
      TaskModel(
          category: 'DESIGN',
          title: 'Create a new landing page Hero image',
          tags: ['DESIGN', 'UI/UX', 'VISUAL'],
          summary:
              'Design team is involved to create a new hero image for the landing page, this should be 1440x900 px. It needs to be peacefull and light.',
          comments: 3),
    );
    return tasks;
  }
}

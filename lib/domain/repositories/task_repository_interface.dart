import '../../data/models/task_model.dart';

abstract class TaskRepositoryInterface {
  Future<List<TaskModel>> fetchTasks();
  Future<void> addTask(TaskModel task);
  Future<void> editTask(TaskModel task);
  Future<void> deleteTask(String id);
}

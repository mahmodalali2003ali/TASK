class TaskModel {
  String id;
  String name;
  String description;
  bool completed; // Added completed property

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    this.completed = false, // Default to false
  });
}

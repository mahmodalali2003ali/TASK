class TaskModel {
  final String id;
  final String name;
  final String description;
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.name,
    required this.description,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? id,
    String? name,
    String? description,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

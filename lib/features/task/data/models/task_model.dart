import '../../domain/entities/task.dart';

class TaskModel extends Task {
  TaskModel({
    required super.id,
    required super.title,
    required super.description,
    required super.isCompleted,
  });

  // Convertir de JSON a TaskModel
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  // Convertir de TaskModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }

  // Convertir de Task a TaskModel
  factory TaskModel.fromEntity(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
    );
  }

  Task toEntity() {
    return Task(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}

import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    String id,
    String description,
    bool completed,
  }) : super(
          id: id,
          description: description,
          completed: completed,
        );

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        id: json['id'],
        description: json['description'],
        completed: json['completed'],
      );

  static List<TodoModel> fromJsonList(List<Map<String, dynamic>> jsonList) =>
      jsonList.map((json) => TodoModel.fromJson(json)).toList();

  Map<String, dynamic> toJson() => {
        'description': this.description,
        'completed': this.completed,
      };
}

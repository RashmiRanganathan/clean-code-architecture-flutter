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

  factory TodoModel.fromJson(dynamic json) => TodoModel(
        id: json['_id'],
        description: json['description'],
        completed: json['completed'] ?? false,
      );

  static List<TodoModel> fromJsonList(List<dynamic> jsonList) =>
      jsonList.map((json) => TodoModel.fromJson(json)).toList();

  Map<String, dynamic> toJson() {
    if (this.description == null) {
      return {'completed': this.completed};
    } else if (this.completed == null) {
      return {'description': this.description};
    } else {
      return {};
    }
  }

  TodoModel.castFromEntity(final TodoEntity todo)
      : super(
          id: todo.id,
          description: todo.description,
          completed: todo.completed,
        );
}

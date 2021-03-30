import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    String id,
    bool completed,
    String description,
  }) : super(
          id: id,
          completed: completed,
          description: description,
        );
  factory TodoModel.fromJson(dynamic json) {
    return TodoModel(
      id: json['_id'],
      completed: json['completed'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'completed': completed};
  }
}

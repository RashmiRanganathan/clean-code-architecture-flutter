import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  TodoModel({
    String id,
    String owner,
    bool completed,
    String description,
    DateTime createdAt,
    DateTime updatedAt,
  }) : super(
          id: id,
          owner: owner,
          completed: completed,
          description: description,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );
  factory TodoModel.fromJson(dynamic json) {
    return TodoModel(
        id: json['_id'],
        owner: json['owner'],
        completed: json['completed'],
        description: json['description'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']));
  }

  Map<String, dynamic> toJson() {
    return {'description': description, 'completed': completed};
  }
}

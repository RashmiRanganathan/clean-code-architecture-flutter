import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  int todo;
  String owner;

  TodoModel(
      {String id, bool completed, String description, this.owner, this.todo})
      : super(
          id: id,
          completed: completed,
          description: description,
        );

  factory TodoModel.fromJson(dynamic json) {
    return TodoModel(
        id: json['_id'],
        completed: json['completed'],
        description: json['description'],
        owner: json['owner'],
        todo: json['__v']);
  }

  Map<String, dynamic> get toJson {
    return {'description': description, 'completed': completed};
  }
}

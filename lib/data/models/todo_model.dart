import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String description;
  bool completed;
  String id;

  TodoModel({this.description, this.completed, this.id});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
      description: json['description'],
      completed: json['completed'],
      id: json['_id']);

  static List<TodoModel> fromListJson(List<dynamic> json) {
    List<TodoModel> list = [];
    for (final item in json) {
      list.add(TodoModel.fromJson(item));
    }
    return list;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['completed'] = this.completed;
    data['_id'] = this.id;
    return data;
  }
}

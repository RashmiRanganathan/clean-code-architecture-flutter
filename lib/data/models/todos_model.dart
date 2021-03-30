import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class Todos {
  int count;
  List<TodoModel> data;

  Todos({this.count, this.data});

  Todos.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['data'] != null) {
      data = List<TodoModel>();
      json['data'].forEach((todo) {
        data.add(TodoModel.fromJson(todo));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((todo) => todo.toJson()).toList();
    }
    return data;
  }
}

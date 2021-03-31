import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class CreateTodoModel{
  bool success;
  TodoModel todo;

  CreateTodoModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    todo = json["data"];
  }
}
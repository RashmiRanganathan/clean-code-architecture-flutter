import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class TodoEntity {
  String id;
  bool completed;
  String description;

  TodoEntity({this.id, this.completed, this.description});

  TodoModel toTodoModel() {
    return TodoModel(id: id, description: description, completed: completed);
  }
}

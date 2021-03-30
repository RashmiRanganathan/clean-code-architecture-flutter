import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<void> createTodo(TodoModel model) {
    return todoRespository.createTodo(model);
  }
}

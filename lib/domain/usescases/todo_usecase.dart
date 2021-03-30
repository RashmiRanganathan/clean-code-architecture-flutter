import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../entities/todo_entity.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<Todos> getTodos() => todoRespository.getTodos();

  Future<void> deleteTodoById({String id}) async {
    await todoRespository.deleteTodoById(id: id);
  }

  Future<String> update({TodoEntity todoModel}) {
    return todoRespository.update(todoModel);
  }
}

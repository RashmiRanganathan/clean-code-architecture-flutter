import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<List<TodoEntity>> getAll({bool fromLocal}) async =>
      await todoRespository.getAll(fromLocal: fromLocal);

  Future<TodoEntity> create(TodoEntity todo) async {
    final TodoModel todoModel = TodoModel.castFromEntity(todo);
    return todoRespository.create(todoModel);
  }

  Future<TodoEntity> update(TodoEntity todo) async {
    final TodoModel todoModel = TodoModel.castFromEntity(todo);
    return todoRespository.update(todoModel);
  }

  Future<void> delete(String id) async => await todoRespository.delete(id);
}

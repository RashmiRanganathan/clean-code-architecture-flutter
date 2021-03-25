import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<List<TodoEntity>> getAll() async => await todoRespository.getAll();

  Future<TodoEntity> create(TodoEntity todo) async =>
      await todoRespository.create(todo);

  Future<TodoEntity> update(TodoEntity todo) async =>
      await todoRespository.update(todo);

  Future<void> delete(String id) async => await todoRespository.delete(id);
}

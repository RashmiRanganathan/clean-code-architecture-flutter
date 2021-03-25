import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoRespository {
  Future<List<TodoEntity>> getAll();

  Future<TodoEntity> create(TodoModel todo);

  Future<TodoEntity> update(TodoModel todo);

  Future<void> delete(String id);
}

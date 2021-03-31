import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoRespository {
  Future<Todos> getTodos();
  Future<void> deleteTodoById({String id});
  Future<void>update({String id, bool value});
}

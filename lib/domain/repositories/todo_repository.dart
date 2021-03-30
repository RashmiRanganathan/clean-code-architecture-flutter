import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
abstract class TodoRespository {
  Future<void> deleteTodoById({String id});
  Future<String> update(TodoEntity todoModel);
}

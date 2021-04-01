import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

abstract class TodoRespository {
  Future<List<TodoModel>> fetchTodo();
  Future<void> createTodo({Map payload});
  Future<void> deleteTodo({String id});
  Future<void> updateTodo({String id, Map payload});

}

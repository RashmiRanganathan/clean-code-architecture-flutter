import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import '../../data/models/todo_model.dart';
abstract class TodoRespository {
  Future<void> deleteTodoById({String id});
  Future<void> update(TodoModel todoModel);
  Future<Todos> getTodos();
}

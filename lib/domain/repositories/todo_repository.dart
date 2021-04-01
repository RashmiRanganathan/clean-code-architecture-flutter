import '../../data/models/todo_model.dart';

abstract class TodoRespository {
  Future<List<TodoModel>> getTodoList();
  Future<List<TodoModel>> postTodoList(String desc);
}

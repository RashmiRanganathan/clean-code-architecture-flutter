import '../../data/models/todo_model.dart';

abstract class TodoRespository {
  Future<List<TodoModel>> getTodoList();
  Future<TodoModel> postTodoList(String desc);
  Future<TodoModel> updateTodoList(bool check,String id);
  Future<TodoModel> deleteTodoList(String id);

}

import '../../data/models/todo_model.dart';

abstract class TodoRespository {
  Future<List<TodoModel>> getTodos();
}

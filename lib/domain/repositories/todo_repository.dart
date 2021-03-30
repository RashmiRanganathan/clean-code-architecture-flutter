import '../../data/models/todo_model.dart';

abstract class TodoRespository {
  Future<String>update(TodoModel todoModel);
}

import '../../data/models/todo_model.dart';
import '../entities/todo_entity.dart';

abstract class TodoRespository {
  Future<void> createTodo(TodoModel model);
}

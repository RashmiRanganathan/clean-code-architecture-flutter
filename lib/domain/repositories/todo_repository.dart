import '../entities/todo_entity.dart';

abstract class TodoRespository {
  Future<String>update(TodoEntity todoModel);
}

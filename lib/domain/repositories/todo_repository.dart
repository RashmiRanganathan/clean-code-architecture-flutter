import '../../data/models/todo_model.dart';
abstract class TodoRespository {
  Future<void> deleteTodoById({String id});
  Future<void> update(TodoModel todoModel);
}

import '../../../../data/models/todo_model.dart';

abstract class TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}
class UpdateTodo extends TodoEvent{
  final TodoModel todoModel;
  UpdateTodo(this.todoModel);
  
}

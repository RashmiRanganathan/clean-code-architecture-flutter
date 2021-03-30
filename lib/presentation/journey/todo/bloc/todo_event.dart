import '../../../../data/models/todo_model.dart';

abstract class TodoEvent {}

class UpdateTodo extends TodoEvent{
  final TodoModel todoModel;
  UpdateTodo(this.todoModel);
  
}
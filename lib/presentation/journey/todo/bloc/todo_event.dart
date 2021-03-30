import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}
class UpdateTodo extends TodoEvent{
  final TodoModel todoModel;
  UpdateTodo(this.todoModel);
  
}

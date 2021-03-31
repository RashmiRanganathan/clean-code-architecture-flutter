import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final List<TodoModel> todos;
  final String id;
  DeleteTodo(this.id, this.todos);
}

class UpdateTodo extends TodoEvent{
  final String id;
  UpdateTodo(this.id);
}

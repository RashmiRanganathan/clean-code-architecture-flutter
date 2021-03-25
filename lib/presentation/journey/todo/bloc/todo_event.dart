import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class FetchTodos extends TodoEvent {
  FetchTodos();
}

class AddTodo extends TodoEvent {
  TodoEntity todo;
  AddTodo({this.todo});
}

class UpdateTodo extends TodoEvent {
  TodoEntity todo;
  UpdateTodo({this.todo});
}

class DeleteTodo extends TodoEvent {
  String id;
  DeleteTodo({this.id});
}

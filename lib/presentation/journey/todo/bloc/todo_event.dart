import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class FetchTodos extends TodoEvent {
  bool fromLocal;
  FetchTodos({this.fromLocal});
}

class AddTodo extends TodoEvent {
  TodoEntity todo;
  AddTodo({this.todo});
}

class UpdateTodo extends TodoEvent {
  String id;
  UpdateTodo({this.id});
}

class DeleteTodo extends TodoEvent {
  String id;
  DeleteTodo({this.id});
}

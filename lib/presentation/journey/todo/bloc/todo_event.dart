import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

@immutable
abstract class TodoEvent {}

class FetchTodos extends TodoEvent {
  final bool fromLocal;
  FetchTodos({this.fromLocal});
}

class AddTodo extends TodoEvent {
  final TodoEntity todo;
  AddTodo({this.todo});
}

class UpdateTodo extends TodoEvent {
  final String id;
  UpdateTodo({this.id});
}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo({this.id});
}

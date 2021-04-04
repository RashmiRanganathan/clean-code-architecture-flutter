import 'package:flutter/material.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

@immutable
abstract class TodoState {
  final List<TodoEntity> todos;
  final bool loading;
  TodoState({this.todos, this.loading});
}

class InitialTodos extends TodoState {
  InitialTodos() : super(todos: [], loading: false);
}

class LoadingTodos extends TodoState {
  LoadingTodos({List<TodoEntity> todos}) : super(loading: true);
}

class LoadedTodos extends TodoState {
  LoadedTodos({List<TodoEntity> todos}) : super(todos: todos, loading: false);
}

class ErrorTodos extends TodoState {
  ErrorTodos() : super(loading: false);
}

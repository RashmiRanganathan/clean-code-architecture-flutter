import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoState {
  List<TodoEntity> todos;
  TodoState({this.todos});
}

class TodoInitial extends TodoState {
  TodoInitial() : super(todos: []);
}

class FetchedTodos extends TodoState {
  FetchedTodos({List<TodoEntity> todos}) : super(todos: todos);
}

class UpdatedTodo extends TodoState {
  UpdatedTodo({List<TodoEntity> todos}) : super(todos: todos);
}

class DeletedTodo extends TodoState {
  String id;
  DeletedTodo({List<TodoEntity> todos}) : super(todos: todos);
}

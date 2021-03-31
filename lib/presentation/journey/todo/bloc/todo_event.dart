import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final List<TodoModel> todos;
  final String id;
  DeleteTodo(this.id, this.todos);
}

class UpdateTodo extends TodoEvent {
  final String id;
  final bool value;
  UpdateTodo(this.id, this.value);
}

class CreateNewTodo extends TodoEvent {
  TodoEntity todo;
  CreateNewTodo({this.todo});
}

class ReloadNewTodoForm extends TodoEvent {}

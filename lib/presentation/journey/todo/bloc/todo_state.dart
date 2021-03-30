import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class CreateTodoSuccessfulState extends TodoState {}

class GetTodoSuccessState extends TodoState {
  final List<TodoEntity> todos;

  GetTodoSuccessState(this.todos);
}

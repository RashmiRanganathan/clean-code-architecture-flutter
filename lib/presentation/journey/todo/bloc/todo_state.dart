import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';

abstract class TodoState {
  final Todos todos;

  TodoState({this.todos});
}

class TodoInitial extends TodoState {}

class DeleteTodoLoading extends TodoState {}

class TodoLoadingState extends TodoState {}

class TodoErrorState extends TodoState {}

class TodoFetchState extends TodoState {
  final Todos todos;

  TodoFetchState({this.todos}) : super(todos: todos);
}

class DeleteTodoSuccess extends TodoState {}

class DeleteTodoError extends TodoState {}

class UpdateTodoSuccess extends TodoState {}

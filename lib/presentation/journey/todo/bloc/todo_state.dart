part of 'todo_bloc.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoError extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoEntity> todoList;

  TodoLoaded({this.todoList});
}

class CreateTodoSuccess extends TodoState {}

class DeleteTodoSuccess extends TodoState {}

class UpdateTodoSuccess extends TodoState {}

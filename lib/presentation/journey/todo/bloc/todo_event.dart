part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetTodo extends TodoEvent {
  GetTodo();
}

class CreateTodo extends TodoEvent {
  final String description;

  CreateTodo({this.description});
}

class DeleteTodo extends TodoEvent {
  final String id;

  DeleteTodo({this.id});
}

class UpdateTodo extends TodoEvent {
  final String id;

  UpdateTodo({
    this.id,
  });
}

import '../../../../domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  TodoEntity entity;

  AddTodoEvent({this.entity});
}

class GetTodoEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {
  TodoEntity entity;
  DeleteTodoEvent({this.entity});
}
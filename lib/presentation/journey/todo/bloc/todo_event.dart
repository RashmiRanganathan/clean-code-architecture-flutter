import '../../../../domain/entities/todo_entity.dart';

abstract class TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}
class UpdateTodo extends TodoEvent{
  final TodoEntity todo;
  UpdateTodo(this.todo);
  
}

class TodoFetchEvent extends TodoEvent {}

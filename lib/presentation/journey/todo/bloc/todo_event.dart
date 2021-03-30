abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}
class UpdateTodo extends TodoEvent{
  final String id;
  UpdateTodo(this.id);
  
}

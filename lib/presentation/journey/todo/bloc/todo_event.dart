abstract class TodoEvent {}

class DeleteTodo extends TodoEvent {
  final String id;
  DeleteTodo(this.id);
}

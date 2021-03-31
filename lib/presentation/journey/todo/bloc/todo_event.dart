abstract class TodoEvent {}

class TodoFetchEvent extends TodoEvent {}

class DeleteTodo extends TodoEvent {
  final List<TodoModel> todos;
  final String id;
  DeleteTodo(this.id, this.todos);
}

class UpdateTodo extends TodoEvent {
  final TodoModel todoModel;
  UpdateTodo(this.todoModel);
}

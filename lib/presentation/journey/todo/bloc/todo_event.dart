abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String description;
  AddTodoEvent(this.description);
}

class DeleteTodoEvent extends TodoEvent {
  int index;
  DeleteTodoEvent(this.index);
}

class CompleteTodoEvent extends TodoEvent {
  int index;
  CompleteTodoEvent(this.index);
}

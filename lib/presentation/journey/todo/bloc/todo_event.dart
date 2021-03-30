abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  String description;

  AddTodoEvent({this.description});
}

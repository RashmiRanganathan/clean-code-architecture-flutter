abstract class TodoEvent {}

class GetTodoListEvent extends TodoEvent {}

class PutTodoListEvent extends TodoEvent {
  final String desc;
  PutTodoListEvent({this.desc});
}

abstract class TodoEvent {}

class GetTodoListEvent extends TodoEvent {}

class PostTodoListEvent extends TodoEvent {
  final String desc;
  PostTodoListEvent({this.desc});
}

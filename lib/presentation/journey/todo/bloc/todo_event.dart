abstract class TodoEvent {}

class GetTodoListEvent extends TodoEvent {}

class PostTodoListEvent extends TodoEvent {
  final String desc;
  PostTodoListEvent({this.desc});
}

class UpdateTodoListEvent extends TodoEvent {
  final bool check;
  final String id;
  UpdateTodoListEvent({this.check, this.id});
}

class DeleteTodoListEvent extends TodoEvent {
  final String id;
  DeleteTodoListEvent({this.id});
}

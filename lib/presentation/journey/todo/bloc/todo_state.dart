import '../../../../domain/entities/todo_entity.dart';

abstract class TodoState {
  List<TodoEntity> todoList;
  TodoState(this.todoList);
}

class TodoInitial extends TodoState {
  TodoInitial() : super([]);
}

class UpdatedList extends TodoState {
  UpdatedList(List<TodoEntity> todoList) : super(todoList);
}

class TodoItemsList extends TodoState {
  List<TodoEntity> todoList;

  TodoItemsList({this.todoList}) : super(todoList);
}

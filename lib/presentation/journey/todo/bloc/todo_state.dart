import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

import '../../../../data/models/todo_model.dart';
import '../../../../data/models/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}

class CreateTodoSuccessfulState extends TodoState {}

class TodoItemsList extends TodoState {
  final List<TodoEntity> items;

  TodoItemsList({this.items});
}

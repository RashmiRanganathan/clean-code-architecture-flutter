import 'package:flutter/material.dart';

import '../../../../data/models/todo_model.dart';

abstract class TodoState {}

class TodoInitial extends TodoState {}
class GetTodoState extends TodoState {
  final List<TodoModel> todoList;
  GetTodoState({
    @required this.todoList , 
  });
}

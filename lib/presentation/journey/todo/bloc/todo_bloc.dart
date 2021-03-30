import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

import '../../../../domain/entities/todo_entity.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.runtimeType) {
      case AddTodoEvent:
        yield* handleAddTodoEvent(event);
        break;
      case DeleteTodoEvent:
        yield* handleDeleteTodoEvent(event);
        break;
      case CompleteTodoEvent:
        yield* handleCompleteTodoEvent(event);
        break;
      default:
    }
  }

  Stream<TodoState> handleAddTodoEvent(AddTodoEvent event) async* {
    List<TodoEntity> todoList = state.todoList;
    todoList.add(TodoEntity(completed: false, description: event.description));
    yield UpdatedList(todoList);
  }

  Stream<TodoState> handleDeleteTodoEvent(DeleteTodoEvent event) async* {
    List<TodoEntity> todoList = state.todoList;
    todoList.removeAt(event.index);
    yield UpdatedList(todoList);
  }

  Stream<TodoState> handleCompleteTodoEvent(CompleteTodoEvent event) async* {
    List<TodoEntity> todoList = state.todoList;
    todoList[event.index].completed = !todoList[event.index].completed;
    yield UpdatedList(todoList);
  }

  @override
  TodoState get initialState => TodoInitial([]);
}

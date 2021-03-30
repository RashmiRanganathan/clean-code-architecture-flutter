import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(event);
    }
  }

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodo event) async* {
    yield DeleteTodoLoading();
    try {
      await todousecase.deleteTodoById(id: event.id);
    } catch (e) {
      print(e);
      yield DeleteTodoError();
    }
  }

  @override
  TodoState get initialState => TodoInitial();
}

import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.runtimeType) {
      case TodoFetchEvent:
        yield* _mapTodoFetchEventToState(event);
        break;
    }
  }

  @override
  TodoState get initialState => TodoInitial();

  Stream<TodoState> _mapTodoFetchEventToState(
    TodoFetchEvent event,
  ) async* {
    yield TodoLoadingState();
    try {
      Todos data = await todousecase.getTodos();
      yield TodoFetchState(todos: data);
    } catch (e) {
      yield TodoErrorState();
    }
  }
}

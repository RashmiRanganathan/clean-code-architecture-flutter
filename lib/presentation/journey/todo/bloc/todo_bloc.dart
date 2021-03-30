import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

import '../../../../data/models/todo_model.dart';
import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.runtimeType) {
      case AddTodoEvent:
        yield* _mapAddTodoEvent(event);
        break;
      case GetTodoEvent:
        yield* _mapGetTodoEventToState(event);
        break;
      case DeleteTodoEvent:
        yield* _mapDeleteTodoEventToState(event);
        break;
    }
  }

  @override
  TodoState get initialState => TodoInitial();

  Stream<TodoState> _mapAddTodoEvent(AddTodoEvent event) async* {
    await todousecase
        .createTodo(TodoModel(description: event.entity.description));
    yield CreateTodoSuccessfulState();
  }

  Stream<TodoState> _mapGetTodoEventToState(GetTodoEvent event) async* {
    List<TodoEntity> todos = await todousecase.getTodo();
    yield GetTodoSuccessState(todos);
  }

  Stream<TodoState> _mapDeleteTodoEventToState(DeleteTodoEvent event) async* {
    await todousecase.delete(TodoModel(description: event.entity.description));
    List<TodoEntity> todos = await todousecase.getTodo();
    print(todos);

    yield GetTodoSuccessState(todos);
  }
}

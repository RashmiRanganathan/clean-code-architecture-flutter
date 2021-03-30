import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
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
    }else if(event is UpdateTodo){
      yield* _mapUpdateToState(event);
    }
     switch (event.runtimeType) {
      case TodoFetchEvent:
        yield* _mapTodoFetchEventToState(event);
        break;
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

  Stream<TodoState> _mapUpdateToState(UpdateTodo event) async* {
    try {
    await todousecase.update(todoEntity: event.todo);
     yield UpdateTodoSuccess();
    } catch (e) {
      yield TodoErrorState();
    }
  }

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

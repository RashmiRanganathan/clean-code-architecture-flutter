import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
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
    switch (event.runtimeType) {
      case TodoFetchEvent:
        yield* _mapTodoFetchEventToState(event);
        break;
      case DeleteTodo:
        yield* _mapDeleteTodoToState(event);
        break;
      case UpdateTodo:
        yield* _mapUpdateToState(event);
        break;
      case CreateNewTodo:
        yield* _createTodo(event);
        break;
      case OpenForm:
        yield* _openForm();
        break;
      default:
        yield TodoInitial();
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

  Stream<TodoState> _mapDeleteTodoToState(DeleteTodo event) async* {
    try {
      event.todos
          .removeWhere((TodoModel todoModel) => todoModel.id == event.id);
      await todousecase.deleteTodoById(id: event.id);
      yield DeleteTodoSuccess();
    } catch (e) {
      print(e);
      yield DeleteTodoError();
    }
  }

  Stream<TodoState> _mapUpdateToState(UpdateTodo event) async* {
    try {
      await todousecase.update(id: event.id, value: event.value);
      yield UpdateTodoSuccess();
    } catch (e) {
      yield TodoErrorState();
    }
  }

  Stream<TodoState> _createTodo(CreateNewTodo event) async* {
    yield TodoLoadingState();
    try {
      await todousecase.createTodo(event.todo);
      yield CreateTodoSuccess();
    } catch (e) {
      yield TodoErrorState();
    }
  }

  Stream<TodoState> _openForm() async* {
    yield StartCreateTodo();
  }
}

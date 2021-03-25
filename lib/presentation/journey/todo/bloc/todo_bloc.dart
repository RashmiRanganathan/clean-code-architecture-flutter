import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  TodoState get initialState => TodoInitial();

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    switch (event.runtimeType) {
      case FetchTodos:
        yield* _mapFetchTodoState(event);
        break;
      case AddTodo:
        yield* _mapAddTodoState(event);
        break;
      case UpdateTodo:
        yield* _mapUpdateTodoState(event);
        break;
      case DeleteTodo:
        yield* _mapDeleteTodoState(event);
        break;
      default:
    }
  }

  Stream<TodoState> _mapFetchTodoState(FetchTodos event) async* {
    final todos = await todousecase.getAll(fromLocal: event.fromLocal);
    yield FetchedTodos(todos: todos);
  }

  Stream<TodoState> _mapAddTodoState(AddTodo event) async* {
    final updatedTodo = await todousecase.create(event.todo);
    final List<TodoEntity> todos = this.state.todos;
    todos.add(updatedTodo);

    yield FetchedTodos(todos: todos);
  }

  Stream<TodoState> _mapUpdateTodoState(UpdateTodo event) async* {
    final updatedTodo = await todousecase.update(event.todo);
    final List<TodoEntity> todos = this.state.todos;
    todos[todos.indexWhere((TodoEntity todo) => todo.id == updatedTodo.id)] =
        updatedTodo;

    yield FetchedTodos(todos: todos);
  }

  Stream<TodoState> _mapDeleteTodoState(DeleteTodo event) async* {
    await todousecase.delete(event.id);
    final List<TodoEntity> todos = this.state.todos;
    todos.removeWhere((TodoEntity todo) => todo.id == event.id);

    yield FetchedTodos(todos: todos);
  }
}

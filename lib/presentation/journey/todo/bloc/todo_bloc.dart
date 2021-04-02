import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final Todousecase todousecase;

  TodoBloc({this.todousecase});

  @override
  TodoState get initialState => InitialTodos();

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
    yield LoadingTodos(todos: this.state.todos);
    try {
      final todos = await todousecase.getAll(fromLocal: event.fromLocal);
      yield LoadedTodos(todos: todos);
    } catch (e) {
      yield ErrorTodos();
    }
  }

  Stream<TodoState> _mapAddTodoState(AddTodo event) async* {
    final todos = this.state.todos;
    yield LoadingTodos(todos: todos);
    try {
      final updatedTodo = await todousecase.create(event.todo);
      todos.add(updatedTodo);
      yield LoadedTodos(todos: todos);
    } catch (e) {
      yield ErrorTodos();
    }
  }

  Stream<TodoState> _mapUpdateTodoState(UpdateTodo event) async* {
    final todos = this.state.todos;
    yield LoadingTodos(todos: todos);
    try {
      final todo = todos.singleWhere((TodoEntity todo) => todo.id == event.id);
      todo.completed = !todo.completed;
      final updatedTodo = await todousecase.update(todo);
      todos[todos.indexWhere((TodoEntity todo) => todo.id == updatedTodo.id)] =
          updatedTodo;
      yield LoadedTodos(todos: todos);
    } catch (e) {
      yield ErrorTodos();
    }
  }

  Stream<TodoState> _mapDeleteTodoState(DeleteTodo event) async* {
    final todos = this.state.todos;
    yield LoadingTodos(todos: todos);
    try {
      await todousecase.delete(event.id);
      todos.removeWhere((TodoEntity todo) => todo.id == event.id);
      yield LoadedTodos(todos: todos);
    } catch (e) {
      yield ErrorTodos();
    }
  }
}

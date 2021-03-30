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
    if(event is UpdateTodo){
      yield* updateMapEventToState(event.todoModel);
    }
  }

  @override
  TodoState get initialState => TodoInitial();

  Stream<UpdateTodoSuccess> updateMapEventToState(event) async* {
    final result = await todousecase.update(todoEntity: event);
    if(result.isNotEmpty){
      yield UpdateTodoSuccess();
    }
  }

}

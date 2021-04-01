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
      case GetTodoListEvent:
        yield* _mapGetListTodoState(event);
        break;
      case PostTodoListEvent:
        yield* _mapPutListTodoState(event);
        break;
       case UpdateTodoListEvent:
        yield* _mapUpdateListTodoState(event);
        break;
       case DeleteTodoListEvent:
        yield* _mapDeleteListTodoState(event);
        break;
      
    }
  }

  @override
  TodoState get initialState => TodoInitial();

  Stream<TodoState> _mapGetListTodoState(GetTodoListEvent event) async* {
    final List<TodoModel> getTodoList = await todousecase.getTodoList();
    print(getTodoList);
    yield GetTodoState(todoList: getTodoList);
  }

  Stream<TodoState> _mapPutListTodoState(PostTodoListEvent event) async* {
    try {
      final postTodoList = await todousecase.postTodoList(event.desc);
      print(postTodoList.description);
      yield PostTodoSuccess();
    } catch (e) {
      print(e.toString());
      yield PostTodoFailed();
    }
  }

  Stream<TodoState> _mapUpdateListTodoState(UpdateTodoListEvent event) async* {
    try {
      print('${event.check}');
      print('${event.id}');
      await todousecase.updateTodoList(event.check ,event.id);
      yield UpdateTodoSuccess();
    } catch (e) {
      print(e.toString());
      yield UpdateTodoFailed();
    }
  }

  Stream<TodoState> _mapDeleteListTodoState(DeleteTodoListEvent event) async* {
    try {
      await todousecase.deleteTodoList(event.id);
      yield DeleteTodoSuccess();
    } catch (e) {
      print(e.toString());
      yield DeleteTodoFailed();
    }
  }


}

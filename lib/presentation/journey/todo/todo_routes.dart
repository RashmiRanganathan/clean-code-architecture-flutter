import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/create_todo/create_todo_screen.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/todo_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.todoList: (context) => BlocProvider<TodoBloc>(
          create: (context) => Injector.resolve<TodoBloc>(),child: TodoListScreen(),),
      RouteList.createTodo: (context) =>  BlocProvider<TodoBloc>(
        create: (context) => Injector.resolve<TodoBloc>(),child: CreateTodoScreen(),),
    };
  }
}

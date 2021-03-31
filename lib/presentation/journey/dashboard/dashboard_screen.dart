import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:flutter/material.dart';

import '../../../common/injector/injector.dart';
import '../todo/bloc/todo_bloc.dart';
import '../todo/bloc/todo_event.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('TO-DO'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.headline3,
              ),
              ElevatedButton(
                onPressed: () {
                  Injector.resolve<TodoBloc>().add(GetTodoListEvent());
                  Navigator.of(context).pushNamed(RouteList.todoList);
                },
                child: Text(
                  'Go',
                  style: Theme.of(context).textTheme.button,
                ),
              )
            ],
          ),
        ),
      );
}

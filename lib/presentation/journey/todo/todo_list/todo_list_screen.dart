import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injector/injector.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntity> todoList = [];
  TodoBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = Injector.resolve<TodoBloc>();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('TODOS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteList.createTodo),
            )
          ],
        ),
        body: BlocProvider<TodoBloc>(
          create: (context) => bloc,
          child: BlocBuilder(
            bloc: bloc,
            builder: mapStateToWidget,
          ),
        ),
      );

  void mapStateListner(context, state) {
    if (state is UpdatedList) {
      print('No :  Description , Completed');
      for (final item in state.todoList) {
        print(
            '${state.todoList.indexOf(item)} :  ${item.description} , ${item.completed}');
      }
    }
  }

  Widget mapStateToWidget(context, state) {
    switch (state.runtimeType) {
      case UpdatedList:
      case TodoInitial:
        if (state.todoList.length > 0) {
          return ListView.builder(
            itemCount: state.todoList.length,
            itemBuilder: (context, index) =>
                eachRow(state.todoList[index], index),
          );
        }
        if (state.todoList.isEmpty) {
          return defaultinitialScreen();
        }
        return Container();
        break;
      default:
        return Container();
    }
  }

  Container defaultinitialScreen() => Container(
        alignment: Alignment.center,
        child: Text('Add some new tasks'),
      );

  Container eachRow(TodoEntity todo, int index) => Container(
        margin: const EdgeInsets.all(8.0),
        child: Dismissible(
          key: UniqueKey(),
          onDismissed: (DismissDirection dismiss) {
            bloc.add(DeleteTodoEvent(index));
          },
          child: Row(
            children: [
              Checkbox(
                value: todo.completed,
                onChanged: (bool value) {
                  bloc.add(CompleteTodoEvent(index));
                },
              ),
              SizedBox(
                width: 6.0,
              ),
              Text(
                todo.description,
                style: TextStyle(
                  decoration: todo.completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      );
}

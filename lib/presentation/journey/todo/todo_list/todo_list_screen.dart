import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  TodoBloc todoBloc;
  @override
  void initState() {
    super.initState();
    todoBloc = Injector.resolve<TodoBloc>()
      ..add(GetTodoEvent());
  }

  @override
  void dispose() {
    todoBloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => BlocProvider(
        create: (context) => todoBloc,
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state is GetTodoSuccessState) {
            return Scaffold(
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
              body: ListView.builder(
                itemBuilder: (context, index) {
                  return TodoItem(todo: state.todos[index],);
                },
                itemCount: state.todos.length,
              ),
            );
          }
          return Container();
        }),
      );
}

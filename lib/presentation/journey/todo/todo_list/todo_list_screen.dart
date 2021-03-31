import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injector/injector.dart';
import '../../../../data/models/todo_model.dart';
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
  final bloc = Injector.resolve<TodoBloc>();
  List<TodoModel> listTodo = List<TodoModel>();
  @override
  void initState() {
    super.initState();
    bloc.add(GetTodoListEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) {
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
      body: BlocProvider<TodoBloc>(
          create: (contex) => bloc,
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is GetTodoState) {
                return ListView(
                    children: state.todoList
                        .map((todoitem) => ListTile(
                              title: Text(todoitem.description),
                              leading: Container(
                                child: Icon(Icons.check_circle),
                                // onChanged: () {}
                              ),
                            ))
                        .toList());
              }
              return Container();
            },
          )),
    );
  }
}

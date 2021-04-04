import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  // ignore: close_sinks
  TodoBloc _todoBloc;
  @override
  void initState() {
    // add get todo
    super.initState();
    _todoBloc = Injector.resolve<TodoBloc>()..add(TodoFetchEvent());
  }

  @override
  Widget build(BuildContext buildContext) => BlocProvider(
        create: (BuildContext context) => _todoBloc,
        child: Scaffold(
          key: const ValueKey('list_screen_key'),
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
          body: Center(
            child: BlocConsumer<TodoBloc, TodoState>(
              bloc: _todoBloc,
              listener: (context, state) {
                if (state is UpdateTodoSuccess) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Update data success")));
                  _todoBloc.add(TodoFetchEvent());
                } else if (state is DeleteTodoSuccess) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Delete data success")));
                  _todoBloc.add(TodoFetchEvent());
                } else if (state is CreateTodoSuccess) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("Create data success")));
                }
              },
              builder: (BuildContext context, state) {
                switch (state.runtimeType) {
                  case TodoLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case TodoFetchState:
                  case CreateTodoSuccess:
                    return TodoListWidget(
                        state: state,
                        onDismissable: (id) {
                          _todoBloc.add(DeleteTodo(id, state.todos.data));
                        },
                        onUpdate: (String id, bool value) {
                          _todoBloc.add(UpdateTodo(id, value));
                        });
                    break;
                  default:
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text('null'),
                        );
                      },
                    );
                }
              },
            ),
          ),
        ),
      );
}

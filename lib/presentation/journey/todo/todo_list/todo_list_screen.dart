import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
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
  TodoBloc _todoBloc;
  @override
  void initState() {
    super.initState();
    _todoBloc = Injector.resolve<TodoBloc>()..add(TodoFetchEvent());
  }

  @override
  void dispose() {
    super.dispose();
    _todoBloc?.close();
  }

  @override
  Widget build(BuildContext buildContext) => BlocProvider(
        create: (BuildContext context) => _todoBloc,
        child: Scaffold(
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
              builder: (BuildContext context, state) {
                switch (state.runtimeType) {
                  case TodoLoadingState:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                    break;
                  case TodoFetchState:
                    return ListView.builder(
                      itemCount: state.todos.data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    '${index + 1}. ${state.todos.data[index].description}',
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                      state.todos.data[index]?.completed ??
                                              false
                                          ? 'DONE'
                                          : 'IN PROGRESS'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
              listener: (BuildContext context, state) {},
            ),
          ),
        ),
      );
}

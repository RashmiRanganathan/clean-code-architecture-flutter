import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injector/injector.dart';
import '../../../../domain/entities/todo_entity.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import 'widgets/todo_item.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntity> dummyTodos = [
    TodoEntity(
        completed: true,
        createdAt: DateTime.now(),
        description: 'Coding',
        id: '1',
        owner: '1001',
        updatedAt: DateTime.now()),
    TodoEntity(
        completed: false,
        createdAt: DateTime.now(),
        description: 'Testing',
        id: '2',
        owner: '1001',
        updatedAt: DateTime.now()),
    TodoEntity(
        completed: false,
        createdAt: DateTime.now(),
        description: 'Repeat',
        id: '3',
        owner: '1001',
        updatedAt: DateTime.now()),
  ];

  TodoBloc todoBLoc;
  @override
  void initState() {
    todoBLoc = Injector.resolve<TodoBloc>();
    // add get todo
    super.initState();
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
        body: RefreshIndicator(
          onRefresh: () async {
            //do get
            print('do get');
          },
          child: BlocConsumer<TodoBloc, TodoState>(
            listener: (context, state) {
              if (state is DeleteTodoSuccess) {}
            },
            builder: (context, state) {
              return Center(
                child: ListView.separated(
                  itemCount: dummyTodos.length,
                  itemBuilder: (context, index) {
                    return TodoListTile(
                      todoEntity: dummyTodos[index],
                      onConfirmed: (String id) {
                        //do update
                        print('update $id');
                        todoBLoc.add(UpdateTodo(dummyTodos[index]));
                      },
                      onDismissed: (String id) {
                        //do delete
                        dummyTodos.removeWhere(
                            (TodoEntity element) => element.id == id);
                        print(dummyTodos);
                        todoBLoc.add(DeleteTodo(id));
                        print('delete $id');
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/injector/injector.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_bloc.dart';
import '../bloc/todo_event.dart';
import '../bloc/todo_state.dart';
import '../bloc/todo_state.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  String todoValue = '';
  TodoBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = Injector.resolve<TodoBloc>();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  void onTextChange(value) {
    setState(() {
      todoValue = value;
    });
  }

  void onPressedToDo() {
    print(todoValue);
    bloc.add(AddTodoEvent(todoValue));
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocConsumer<TodoBloc, TodoState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: onTextChange,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter the todo'),
                ),
                ElevatedButton(
                  child: Text('Add todo'),
                  onPressed:
                      todoValue.length > 0 ? () => onPressedToDo() : null,
                )
              ],
            ),
          );
        }, listener: (context, state) {
          if (state is UpdatedList) {
            Navigator.of(context).pop();
          }
        }),
      ));
}

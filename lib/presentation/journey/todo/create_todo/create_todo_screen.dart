import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final descriptionController = TextEditingController();
  final todoBloc = Injector.resolve<TodoBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
        centerTitle: true,
      ),
      body: BlocProvider<TodoBloc>(
          create: (context) => todoBloc,
          child:BlocConsumer<TodoBloc,TodoState>(
        listener: (context, state) {
          switch (state.runtimeType) {
            case PostTodoSuccess:

            todoBloc.add(GetTodoListEvent());
            return Navigator.of(context).pop();
            default:
              break;

          }
        },
            builder: (context, state) {
           
              return Center(
              child: Column(
                children: [
                  SizedBox(
                    width: 200,
                    child: TextField(
                      controller: descriptionController,
                      decoration:
                          const InputDecoration(labelText: 'Description'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RaisedButton(
                    onPressed: () {
                      todoBloc.add(
                          PostTodoListEvent(desc: descriptionController.text));
                    },
                    child: const Text('Create'),
                  )
                ],
              ),
            );
            },
          )));
}

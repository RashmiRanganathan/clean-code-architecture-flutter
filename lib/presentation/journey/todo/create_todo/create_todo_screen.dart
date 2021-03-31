import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
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
  final TextEditingController _descController = new TextEditingController();
  TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = Injector.resolve<TodoBloc>();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _todoBloc?.close();
  }

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Todo'),
        centerTitle: true,
      ),
      body: Center(
        child: BlocProvider<TodoBloc>(
          create: (BuildContext context) => _todoBloc,
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (BuildContext context, TodoState todoState) {
              if (todoState is TodoInitial) {
                return Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextField(
                        controller: _descController,
                        decoration: InputDecoration(labelText: "description"),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        onPressed: () {
                          String desc = _descController.text;
                          _saveNewTodo(desc);
                        },
                        child: Text("Save"),
                      )
                    ],
                  ),
                );
              } else if (todoState is CreatingTodo) {
                return CircularProgressIndicator();
              } else if (todoState is TodoCreated) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 100),
                        Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green
                          ),
                          child: Icon(Icons.check),
                        ),
                        SizedBox(height: 40),
                        Text("Todo have been created"),
                        SizedBox(height: 100),
                        RaisedButton(
                            child: Text("Add new todo"),
                            onPressed: _createNewTodo),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  void _saveNewTodo(String desc) {
    TodoEntity todo = TodoEntity(description: desc);
    _todoBloc.add(CreateNewTodo(todo: todo));
  }

  void _createNewTodo() {
    _descController.text = "";
    _todoBloc.add(Reload());
  }
}

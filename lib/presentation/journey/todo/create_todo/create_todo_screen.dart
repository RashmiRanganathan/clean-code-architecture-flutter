import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
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
  TodoBloc _todoBloc;

  @override
  void initState() {
    _todoBloc = Injector.resolve<TodoBloc>()..add(OpenForm());
    super.initState();
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
          child: BlocConsumer<TodoBloc, TodoState>(
            listener: (BuildContext context, TodoState todoState) {
              if (todoState is CreateTodoSuccess) {
                Navigator.pop(context);
              }
            },
            builder: (BuildContext context, TodoState todoState) {
              if (todoState is StartCreateTodo) {
                return TodoForm(
                  saveFunction: (String desc) {
                    _todoBloc.add(
                      CreateNewTodo(
                        todo: TodoEntity(description: desc),
                      ),
                    );
                  },
                );
              } else if (todoState is TodoLoadingState) {
                return CircularProgressIndicator();
              } else if (todoState is TodoErrorState) {
                return CreateTodoFailed(addNewTodo: _addNewTodo);
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }

  void _addNewTodo() {
    _todoBloc.add(OpenForm());
  }
}

class TodoForm extends StatefulWidget {
  final Function saveFunction;

  TodoForm({this.saveFunction});

  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final TextEditingController _descController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              widget.saveFunction(_descController.text);
            },
            child: Text("Save"),
          )
        ],
      ),
    );
  }
}

class CreateTodoFailed extends StatelessWidget {
  final Function addNewTodo;

  CreateTodoFailed({this.addNewTodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Failed to create new Todo, please try again later",
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            RaisedButton(
              child: Text("Add new todo"),
              onPressed: addNewTodo,
            ),
          ],
        ),
      ),
    );
  }
}

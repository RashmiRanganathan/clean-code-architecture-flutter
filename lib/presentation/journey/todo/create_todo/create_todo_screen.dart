import 'package:flutter/material.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/create_todo/create_todo_constants.dart';

class CreateTodoScreen extends StatefulWidget {
  final Function onCreate;

  CreateTodoScreen({
    Key key,
    this.onCreate,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: const Text('Create Todo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  key: CreateTodoConstants.descriptionFieldKey,
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ),
              const SizedBox(height: 20),
              RaisedButton(
                key: CreateTodoConstants.createTodoButton,
                onPressed: () {
                  final TodoEntity todo = TodoEntity(
                    description: descriptionController.text,
                  );
                  widget.onCreate(todo);
                },
                child: const Text('Create'),
              )
            ],
          ),
        ),
      );
}

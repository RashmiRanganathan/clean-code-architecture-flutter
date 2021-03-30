import 'package:flutter/material.dart';

import '../../../../domain/entities/todo_entity.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  var descriptionController = TextEditingController();

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
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('Create Todo'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: 200,
                child: TextField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final TodoEntity todo = TodoEntity(
                    description: descriptionController.text,
                  );
                },
                child: const Text('Create'),
              )
            ],
          ),
        ),
      );
}

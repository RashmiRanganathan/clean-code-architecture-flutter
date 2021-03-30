import 'package:flutter/material.dart';

class CreateTodoScreen extends StatefulWidget {
  CreateTodoScreen({
    Key key,
  }) : super(key: key);

  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {

  String todoValue = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onTextChange(value) {
    setState(() {
      todoValue = value;
    });
  }

 void onPressedToDo() {
   print(todoValue);
   Navigator.pop(context, todoValue);
  }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('Create Todo'),
          centerTitle: true,
        ),
        body: Padding(
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
                onPressed: todoValue.length > 0 ? () => onPressedToDo() : null,
              )
            ],
          ),
        ),
      );
}

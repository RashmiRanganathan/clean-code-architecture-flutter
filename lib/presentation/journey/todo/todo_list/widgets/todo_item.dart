import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  @override
  _TodoItemState createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 3,
        child: Dismissible(
          child: ListTile(
            title: Text('Text'),
          ),
          onDismissed: (direction) {},
          key: Key('a'),
          background: Container(
            color: Colors.red,
          ),
          secondaryBackground: Container(
            color: Colors.green,
          ),
        ));
  }
}

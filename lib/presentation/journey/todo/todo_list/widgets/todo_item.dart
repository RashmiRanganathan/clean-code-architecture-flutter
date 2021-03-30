import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_left.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_right.dart';
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
          background: SwipeLeft(),
          secondaryBackground: SwipeRight(),
        ));
  }
}

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_left.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_right.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String text;
  final bool isCompleted;

  TodoItem(this.text, this.isCompleted);
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
            title: Text(widget.text,
                style: TextStyle(
                    decoration: widget.isCompleted
                        ? TextDecoration.lineThrough
                        : null)),
          ),
          onDismissed: (direction) {},
          key: Key(widget.text),
          background: SwipeLeft(),
          secondaryBackground: SwipeRight(),
        ));
  }
}

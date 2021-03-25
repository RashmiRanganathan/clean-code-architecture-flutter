import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final Function onUpdate;
  final Function onDelete;

  TodoItem({this.todo, this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      child: ListTile(
        title: Text(
          todo.description,
          style: todo.completed
              ? Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(decoration: TextDecoration.lineThrough)
              : Theme.of(context).textTheme.bodyText1,
        ),
        leading: IconButton(
          onPressed: onUpdate,
          icon: Icon(
            todo.completed
                ? Icons.check_circle_rounded
                : Icons.check_circle_outline,
          ),
        ),
      ),
      onDismissed: (direction) async {
        onDelete();
      },
    );
  }
}

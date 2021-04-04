import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final Function onUpdate;
  final Function onDelete;

  TodoItem({Key key, this.todo, this.onUpdate, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: const Align(
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.endToStart) {
          onDelete();
        }
      },
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
          key: ValueKey('${todo.id}_icon'),
          onPressed: onUpdate,
          icon: Icon(
            todo.completed
                ? Icons.check_circle_rounded
                : Icons.check_circle_outline,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../domain/entities/todo_entity.dart';

class TodoListTile extends StatelessWidget {
  final TodoEntity todoEntity;
  final Function(String id) onDismissed;
  final Function(String id) onConfirmed;

  TodoListTile(
      {this.todoEntity,
      @required this.onDismissed,
      @required this.onConfirmed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
          key: Key('todo_tile_${todoEntity.id}'),
          background: Container(
            color: Colors.green,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.done_all_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              onConfirmed(todoEntity.id);
              return false;
            }
            return true;
          },
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              onDismissed(todoEntity.id);
            }
          },
          child: ListTile(
            leading: Icon(todoEntity.completed
                ? Icons.check_circle
                : Icons.check_circle_outlined),
            title: Text(todoEntity.description,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  decoration:
                      todoEntity.completed ? TextDecoration.lineThrough : null,
                )),
          )),
    );
  }
}

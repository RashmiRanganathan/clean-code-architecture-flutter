import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  final TodoState state;
  final Function(String id) onDismissable;

  const TodoListWidget({Key key, this.state, this.onDismissable})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.todos.data.length,
      itemBuilder: (context, index) {
        final todos = state.todos.data[index];
        return Dismissible(
          key: Key('card_todos_${todos.id}'),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              onDismissable?.call(todos.id);
            }
          },
          child: TodoCard(
            text: '${todos.description}',
          ),
        );
      },
    );
  }
}

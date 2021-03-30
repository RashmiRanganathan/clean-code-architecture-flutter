import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  final TodoState state;
  final Function(String id) onDismissable;
  final Function(String id) onUpdate;

  const TodoListWidget({Key key, this.state, this.onDismissable, this.onUpdate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.todos.data.length,
      itemBuilder: (context, index) {
        final todos = state.todos.data[index];
        return Dismissible(
          key: Key('card_todos_${todos.id}'),
          direction: DismissDirection.horizontal,
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

          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              onDismissable?.call(todos.id);
            }
          },
          confirmDismiss: (DismissDirection direction) async{
            if (direction == DismissDirection.startToEnd) {
              onUpdate.call(todos.id);
              return false;
            }
            return true;
          },
          child: TodoCard(
            text1: Text(
              '${index + 1}. ${todos.description}',
            ),
            text2: Text(todos?.completed ?? false ? 'DONE' : 'IN PROGRESS'),
          ),
        );
      },
    );
  }
}

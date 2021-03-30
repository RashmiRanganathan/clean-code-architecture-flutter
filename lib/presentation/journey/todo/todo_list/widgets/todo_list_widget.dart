import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_card_widget.dart';
import 'package:flutter/material.dart';

class TodoListWidget extends StatelessWidget {
  final TodoState state;

  const TodoListWidget({Key key, this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: state.todos.data.length,
      itemBuilder: (context, index) {
        final todos = state.todos.data[index];
        return TodoCard(
          text: '${todos.description}',
        );
      },
    );
  }
}
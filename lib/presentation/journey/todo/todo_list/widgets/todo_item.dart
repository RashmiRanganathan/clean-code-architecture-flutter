import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_left.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/swipe_right.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final TodoBloc todoBloc;
  final TodoEntity todo;

  const TodoItem({Key key, this.todo, this.todoBloc}) : super(key: key);

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
            title: Text(widget.todo.description,
                style: TextStyle(
                    decoration: widget.todo.completed
                        ? TextDecoration.lineThrough
                        : null)),
          ),
          onDismissed: (direction) {
            //delete
            if(direction == DismissDirection.endToStart){
              final TodoEntity todo = TodoEntity(
                    description: widget.todo.description,
                  );
              widget.todoBloc.add(DeleteTodoEvent(entity: todo));
            } 
            //completed
            else if (direction == DismissDirection.startToEnd){

            }
          },
          key: Key(widget.todo.description),
          background: SwipeLeft(),
          secondaryBackground: SwipeRight(),
        ));
  }
}

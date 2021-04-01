import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoItems extends StatelessWidget {
  final TodoBloc todoBloc;
  final TodoEntity todo;

  const TodoItems({Key key,  this.todoBloc, this.todo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todo.id),
      child: ListTile(
        leading: InkWell(
            onTap: () {
              todoBloc.add(UpdateTodo(id: todo.id));

            },
            child: Container(
              child: Icon(todo.completed
                  ? Icons.check_circle
                  : Icons.check_circle_outline),
            )),
        title: Text(
          todo.description,
          style: TextStyle(
            decoration: todo.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            decorationColor: Colors.black,
            decorationStyle: TextDecorationStyle.solid,
          ),
        ),
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          // Right Swipe
          todoBloc.add(UpdateTodo(id: todo.id));
          //delete
        } else if (direction == DismissDirection.endToStart) {
          //Left Swipe
          todoBloc.add(DeleteTodo(id: todo.id));
          //  update
        }
      },
      secondaryBackground: Container(
        child: Container(padding: EdgeInsets.all(10),child: Icon(Icons.delete),alignment: Alignment.centerRight,),
        color: Colors.red,
      ),
      background: Container(
        child: Container(padding: EdgeInsets.all(10),child: Icon(Icons.check_circle),alignment: Alignment.centerLeft),
        color: Colors.blue,
      ),
    );

  }
}

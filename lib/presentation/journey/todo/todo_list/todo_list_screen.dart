import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/todo_entity.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<TodoEntity> todoList = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // toggleCheckbox(int index){
  //   TodoEntity currentTodo =
  // }

  @override
  Widget build(BuildContext buildContext) => Scaffold(
        appBar: AppBar(
          title: Text('TODOS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => createTodo(buildContext),
            )
          ],
        ),
        body: todoList.length > 0
            ? ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  TodoEntity todoItem = todoList[index];
                  return eachRow(todoItem, index);
                },
              )
            : defaultinitialScreen(),
      );

  Container defaultinitialScreen() {
    return Container(
        alignment: Alignment.center, child: Text('Add some new tasks'));
  }

  Container eachRow(TodoEntity todo, int index) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        child: Dismissible(
            key: UniqueKey(),
            onDismissed: (DismissDirection dismiss) {
              setState(() {
                todoList.removeAt(index);
              });
            },
            child: Row(
              children: [
                Checkbox(
                  value: todo.completed,
                  onChanged: (bool value) {
                    setState(() {
                      todo.completed = !todo.completed;
                    });
                  },
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(todo.description,
                    style: TextStyle(
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
              ],
            )));
  }

  void createTodo(BuildContext context) async {
    await Navigator.of(context)
        .pushNamed(RouteList.createTodo)
        .then((value) => updateTheTodoList(value));
  }

  void updateTheTodoList(String value) {
    setState(() {
      todoList.add(TodoEntity(completed: false, description: value));
    });
  }
}

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoListScreen extends StatelessWidget {
  final List<TodoEntity> todos;
  final Function onUpdate;
  final Function onDelete;
  final Function forceRefresh;

  TodoListScreen({
    Key key,
    this.todos,
    this.onUpdate,
    this.onDelete,
    this.forceRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('TODOS'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteList.createTodo),
            )
          ],
        ),
        body: todos.length != 0
            ? RefreshIndicator(
                onRefresh: forceRefresh,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: todos.length,
                  itemBuilder: (_, int index) => TodoItem(
                    todo: todos[index],
                    onUpdate: () => onUpdate(
                      TodoEntity(
                        id: todos[index].id,
                        completed: !todos[index].completed,
                      ),
                    ),
                    onDelete: () => onDelete(todos[index].id),
                  ),
                  separatorBuilder: (_, __) => const Divider(),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_list_constants.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_item.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';

class TodoListScreen extends StatefulWidget {
  TodoListScreen({
    Key key,
  }) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  // ignore: close_sinks
  TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = Injector.resolve<TodoBloc>()..add(FetchTodos());
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('TODOS'),
          centerTitle: true,
          actions: [
            IconButton(
              key: TodoListConstants.createTodoIcon,
              icon: const Icon(Icons.add),
              onPressed: () =>
                  Navigator.of(context).pushNamed(RouteList.createTodo),
            )
          ],
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          bloc: todoBloc,
          builder: (context, todoState) {
            return _mapStateToWidget(todoState);
          },
        ),
      );

  Widget _mapStateToWidget(TodoState todoState) {
    switch (todoState.runtimeType) {
      case InitialTodos:
        return Container();
      case LoadingTodos:
        return Stack(
          children: [
            _todoList(todoState.todos ?? []),
            const Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent),
            ),
          ],
        );
        break;
      case LoadedTodos:
        final List<TodoEntity> todos = todoState.todos;
        if (todos == null || todos.isEmpty) {
          return Center(
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.createTodo);
              },
              child: const Text('Add Todo'),
            ),
          );
        }
        return _todoList(todos);
        break;
      case ErrorTodos:
        return const Center(
          child: Text('Errored'),
        );
        break;
      default:
        return Container();
    }
  }

  Widget _todoList(List<TodoEntity> todos) {
    return RefreshIndicator(
      onRefresh: () async {
        todoBloc.add(FetchTodos(fromLocal: false));
      },
      child: ListView.separated(
        itemCount: todos.length ?? 0,
        itemBuilder: (_, int index) => TodoItem(
          todo: todos[index],
          onUpdate: () => todoBloc
            ..add(
              UpdateTodo(
                id: todos[index].id,
              ),
            ),
          onDelete: () => todoBloc..add(DeleteTodo(id: todos[index].id)),
        ),
        separatorBuilder: (_, __) => const Divider(height: 1),
      ),
    );
  }
}

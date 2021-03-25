import 'package:pedantic/pedantic.dart';

import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });

  Future<List<TodoModel>> getAll({bool fromLocal}) async {
    List<TodoModel> todos = await todoLocalDatasource.getFormattedData();
    if (todos.isEmpty || !(fromLocal ?? true)) {
      todos = await todoRemoteDatasource.getAll();
      unawaited(todoLocalDatasource.insertOrUpdateAll(todos));
    }
    return todos;
  }

  @override
  Future<TodoModel> create(TodoModel todoModel) async {
    TodoModel todo = await todoRemoteDatasource.create(todoModel);
    if (todo != null) {
      await todoLocalDatasource.insertOrUpdateItem(todo);
    }
    return todo;
  }

  @override
  Future<void> delete(String id) async {
    TodoModel todo = await todoRemoteDatasource.delete(id);
    if (todo != null) {
      await todoLocalDatasource.delete(id);
    }
  }

  @override
  Future<TodoModel> update(TodoModel model) async {
    TodoModel todo = await todoRemoteDatasource.update(model);
    if (todo != null) {
      await todoLocalDatasource.insertOrUpdateItem(todo);
    }
    return todo;
  }
}

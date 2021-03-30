import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../datasources/local/local_database/tables/todo_table.dart';
import '../models/todo_model.dart';

class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });

  @override
  Future<void> createTodo(TodoModel model) {
    return todoLocalDatasource.put(
        model.description, TodoTable.fromModel(model));
  }

  @override
  Future<List<TodoModel>> getTodo() {
    return todoLocalDatasource.getAll();
  }

  @override
  Future<void> deleteTodo(TodoModel model) {
    return todoLocalDatasource.delete(model.description);
  }
}

import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });

  @override
  Future<void> deleteTodoById({String id}) async {
    try {
      await todoLocalDatasource.delete(id);
      await todoRemoteDatasource.deleteTodoById(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> update(TodoModel todoModel) async {
    try {
      String id = todoModel.id;
      Map<String, dynamic> payload = {'completed': todoModel.completed};
      await todoRemoteDatasource.updateTodoById(id, payload);
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}

import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../domain/entities/todo_entity.dart';

class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });

  @override
  Future<Todos> getTodos() async => await todoRemoteDatasource.getTodos();

  Future<void> deleteTodoById({String id}) async {
    try {
      await todoLocalDatasource.delete(id);
      await todoRemoteDatasource.deleteTodoById(id);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> update(TodoEntity todoModel) async {
    try {
      String id = todoModel.id;
      Map<String, dynamic> payload = {'completed': todoModel.completed};
      final String url = 'https://api-nodejs-todolist.herokuapp.com/task/$id';
      final result = await todoRemoteDatasource.httpClient.put(url, payload);
      return result;
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}

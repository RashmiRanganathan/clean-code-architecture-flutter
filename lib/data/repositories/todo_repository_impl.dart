import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';
class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });

  
  Future<Todos> getTodos() async => await todoRemoteDatasource.getTodos();

  Future<void> deleteTodoById({String id}) async {
    try {
      await todoLocalDatasource.delete(id);
      await todoRemoteDatasource.deleteTodoById(id);
    } catch (e) {
      rethrow;
    }
  }

   Future<void> update({String id}) async {
    try {
      Map<String, dynamic> payload = {'completed': true};
      print('REPO: $id dan $payload');
      // await todoRemoteDatasource.updateTodoById(id, payload);
    } catch (e) {
      throw Exception('Failed to update data');
    }
  }
}


import 'package:clean_code_architecture_flutter/common/exceptions/server_exception.dart';
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

  @override
  Future<List<TodoModel>> fetchTodo() async {
    try {
      List<TodoModel> todoList = [];
      final response = await todoRemoteDatasource.fetchTodo();
      for (var item in response) {
        todoList.add(TodoModel.fromJson(item));
      }
      return todoList;
    } catch (e) {
      throw ServerException(message: e, code: '500');
    }
  }

  @override
  Future<void> createTodo({Map payload}) async {
    try {
      await todoRemoteDatasource.createTodo(payload);
    } catch (e) {
      throw ServerException(message: e, code: '500');
    }
  }

  @override
  Future<void> deleteTodo({String id}) async {
    try {
      await todoRemoteDatasource.deleteTodo(id);
    } catch (e) {
      throw ServerException(message: e, code: '500');
    }
  }

  @override
  Future<void> updateTodo({String id, Map payload}) async {
    try {
      await todoRemoteDatasource.updateTodo(id, payload);
    } catch (e) {
      throw ServerException(message: e, code: '500');
    }
  }
}

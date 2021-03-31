import 'package:clean_code_architecture_flutter/common/constants/http_constants.dart';
import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/constants/todo_remote_datasource_constants.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<Todos> getTodos() async {
    final response =
        await httpClient.get(TodoEndpoints.getCreateUpdateDeletePath);

    return Todos.fromJson(response);
  }

  Future<void> deleteTodoById(String id) async {
    await httpClient.delete('${TodoEndpoints.getCreateUpdateDeletePath}/$id');
  }

  Future<dynamic> updateTodoById(String id, Map<String, dynamic> data) async {
    return await httpClient.put(
        '${TodoEndpoints.getCreateUpdateDeletePath}/$id', data);
  }

  Future<TodoModel> createTodo(TodoModel todo) async {
    Map<String, dynamic> response = await httpClient.post(
        TodoEndpoints.getCreateUpdateDeletePath, todo.toJson);
    return TodoModel.fromJson(response);
  }
}

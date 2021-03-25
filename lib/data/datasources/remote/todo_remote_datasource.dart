import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/constants/todo_remote_datasource_constants.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<List<TodoModel>> getAll() async {
    final List<dynamic> data =
        await httpClient.get(TodoEndpoints.getCreateUpdateDeletePath);
    return TodoModel.fromJsonList(data);
  }

  Future<TodoModel> create(TodoModel todo) async {
    final Map<String, dynamic> data = await httpClient.post(
      TodoEndpoints.getCreateUpdateDeletePath,
      todo.toJson(),
    );
    return TodoModel.fromJson(data);
  }

  Future<TodoModel> update(TodoModel todo) async {
    final Map<String, dynamic> data = await httpClient.put(
      '${TodoEndpoints.getCreateUpdateDeletePath}/${todo.id}',
      todo.toJson(),
    );
    return TodoModel.fromJson(data);
  }

  Future<TodoModel> delete(String id) async {
    final Map<String, dynamic> data = await httpClient.delete(
      '${TodoEndpoints.getCreateUpdateDeletePath}/$id',
    );
    return TodoModel.fromJson(data);
  }
}

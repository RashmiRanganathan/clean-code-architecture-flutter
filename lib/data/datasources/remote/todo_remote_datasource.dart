import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/constants/todo_remote_datasource_constants.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<Todos> getTodos() async {
    final response = await httpClient.get(TodoEndpoints.getCreateUpdateDeletePath);

    return Todos.fromJson(response);
  }
}

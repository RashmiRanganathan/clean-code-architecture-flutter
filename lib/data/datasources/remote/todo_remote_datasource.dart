import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<Todos> getTodos() async {
    final response = await httpClient.get('/task');

    return Todos.fromJson(response);
  }
}

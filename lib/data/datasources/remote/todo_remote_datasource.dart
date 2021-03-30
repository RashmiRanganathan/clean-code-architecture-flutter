import 'package:clean_code_architecture_flutter/common/http/http_client.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  String baseUrl = 'https://api-nodejs-todolist.herokuapp.com/task';

  Future<void> deleteTodoById(String id) async {
    await httpClient.delete('$baseUrl/id');
  }
}


import 'package:clean_code_architecture_flutter/common/http/http_client.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  final String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw";

  TodoRemoteDatasource({this.httpClient});

  Future<dynamic> fetchTodo() async {
    final response = await httpClient.get('/task',overrideHeader: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print('UPDATE $response');
    return response;
  }

  Future<dynamic> updateTodo(String id,Map payload,) async {
    await httpClient.put('/task/$id',payload,overrideHeader:  {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

  Future<dynamic> deleteTodo(String id) async {
    await httpClient.delete('/task/$id',overrideHeader: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }
  Future<dynamic> createTodo(Map payload) async {
    await httpClient.post('/task',payload,overrideHeader: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  }

}

import 'dart:convert';


import 'package:clean_code_architecture_flutter/common/http/http_client.dart';

import '../../models/todo_model.dart';
import 'package:http/http.dart' as http;


class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<List<TodoModel>> getTodoList() async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    final http.Response response = await http.get(url,headers: headers);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromListJson(responseJson);
  }

  Future<List<TodoModel>> postTodoList(String todoDescription) async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    print(todoDescription);
    final body = { 'description': todoDescription
    };
    final http.Response response = await http.post(url,headers: headers , body: body);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromListJson(responseJson);
  }

  Future<List<TodoModel>> deleteTodoList() async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task/6059f3f4ee0bf500173331b4';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    
    final http.Response response = await http.delete(url,headers: headers);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromListJson(responseJson);
  }

  Future<List<TodoModel>> updateTodoList(String todoCompleted) async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task/6059f3f4ee0bf500173331b4';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    final body = { 'completed': todoCompleted
    };
    final http.Response response = await http.put(url,headers: headers, body: body);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromListJson(responseJson);
  }
}

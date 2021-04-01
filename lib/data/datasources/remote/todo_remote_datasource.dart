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

  Future<TodoModel> postTodoList(String todoDescription) async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    print(todoDescription);
    final body = json.encode({ 'description': todoDescription
    }); 
    final http.Response response = await http.post(url,headers: headers , body: body);
    print(response.body);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromJson(responseJson['data']);
  }

  Future<TodoModel> deleteTodoList(String id) async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task/$id';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    
    final http.Response response = await http.delete(url,headers: headers);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromJson(responseJson);
  }

  Future<TodoModel> updateTodoList(bool check , String id ) async {
    String url = 'https://api-nodejs-todolist.herokuapp.com/task/$id';
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MDU5ZjNiMGVlMGJmNTAwMTczMzMxYjEiLCJpYXQiOjE2MTY1MDc4NjV9.1lK6qmdulGwJ6btFZ8bFqr2Zsb8N83x6Ce6DQPnRQHw',
      'Content-Type': 'application/json'
    };
    final body =json.encode({ 'completed': check
    });
    final http.Response response = await http.put(url,headers: headers, body: body);
    var responseJson = json.decode(response.body.toString());
    print(responseJson);
    return TodoModel.fromJson(responseJson);
  }
}

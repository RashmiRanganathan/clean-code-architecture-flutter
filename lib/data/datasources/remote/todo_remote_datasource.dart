import 'package:clean_code_architecture_flutter/common/http/http_client.dart';

import '../../models/todo_model.dart';
import '../../models/todo_model.dart';
import 'constants/todo_remote_datasource_constants.dart';

class TodoRemoteDatasource {
  final HttpClient httpClient;
  TodoRemoteDatasource({this.httpClient});

  Future<List<TodoModel>> getTodos() async {
    try {
      final response =
          await httpClient.get(TodoEndpoints.getCreateUpdateDeletePath);
      print(response);
      final result = TodoModel.fromListJson(response);

      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

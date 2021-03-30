import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
abstract class TodoRespository {
  Future<void> deleteTodoById({String id});
  Future<void> update({String id});
  Future<Todos> getTodos();
}

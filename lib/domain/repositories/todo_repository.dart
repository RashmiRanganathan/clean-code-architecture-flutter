import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';

abstract class TodoRespository {
  Future<Todos> getTodos();
}

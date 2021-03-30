import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';
import '../../data/models/todo_model.dart';
import '../entities/todo_entity.dart';
import '../entities/todo_entity.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<String> update({TodoEntity todoEntity}){
    TodoModel model = todoEntity.todoModel();
    return todoRespository.update(model);
  }
}

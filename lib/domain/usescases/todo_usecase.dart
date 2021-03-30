import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../entities/todo_entity.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<String> update({TodoEntity todoModel}){
    return todoRespository.update(todoModel);
  }
}

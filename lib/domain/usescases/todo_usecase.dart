import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<void> createTodo(TodoModel model) {
    return todoRespository.createTodo(model);
  }

  Future<List<TodoEntity>> getTodo() async{
    final data = await todoRespository.getTodo();
    
    return data.map((model)=> model.toEntity()).toList();
  }
}

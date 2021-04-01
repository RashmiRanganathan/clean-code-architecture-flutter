import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});
  Future<List<TodoModel>> getTodoList()async{
    return todoRespository.getTodoList();
  }
  Future<List<TodoModel>> postTodoList(String desc)async{
    return todoRespository.postTodoList(desc);
  }
}

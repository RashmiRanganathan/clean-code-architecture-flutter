import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});
  Future<List<TodoModel>> getTodoList()async{
    return todoRespository.getTodoList();
  }
  Future<TodoModel> postTodoList(String desc)async{
    return todoRespository.postTodoList(desc);
  }
  Future<TodoModel> updateTodoList(bool check, String id )async{
    return todoRespository.updateTodoList(check,id);
  }
  Future<TodoModel> deleteTodoList(String id)async{
    return todoRespository.deleteTodoList(id);
  }
}

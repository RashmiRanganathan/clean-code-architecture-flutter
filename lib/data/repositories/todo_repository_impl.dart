import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../models/todo_model.dart';

class TodoRespositoryImpl extends TodoRespository {
  final TodoRemoteDatasource todoRemoteDatasource;
  final TodoLocalDatasource todoLocalDatasource;

  TodoRespositoryImpl({
    this.todoRemoteDatasource,
    this.todoLocalDatasource,
  });
  @override
  Future<List<TodoModel>> getTodoList()async{
    return todoRemoteDatasource.getTodoList();
  }
  Future<TodoModel> postTodoList(String desc)async {
    return todoRemoteDatasource.postTodoList(desc);
  }
   Future<TodoModel> updateTodoList(bool check , String id)async {
    return todoRemoteDatasource.updateTodoList(check ,id );
  }
   Future<TodoModel> deleteTodoList(String id)async {
    return todoRemoteDatasource.deleteTodoList(id);
  }
}

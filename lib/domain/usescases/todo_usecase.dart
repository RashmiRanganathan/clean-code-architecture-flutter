import 'package:clean_code_architecture_flutter/common/exceptions/server_exception.dart';
import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<List<TodoEntity>> fetchTodo() async{
    try{
      final response =  await todoRespository.fetchTodo();
      return  response;
    }catch(e){
      throw  ServerException(message: e,code:'500');
    }
  }
  Future<void> createTodo({Map payload}) async{
    await todoRespository.createTodo(payload: payload);
  }
  Future<void> updateTodo({String id,Map payload}) async{
    await todoRespository.updateTodo(id: id,payload: payload);
  }
  Future<void> deleteTodo({String id}) async{
    await todoRespository.deleteTodo(id: id);
  }
}

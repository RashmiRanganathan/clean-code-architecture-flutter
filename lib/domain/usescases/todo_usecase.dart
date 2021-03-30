import 'package:clean_code_architecture_flutter/data/models/todos_model.dart';
import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<void> deleteTodoById({String id}) async {
    await todoRespository.deleteTodoById(id: id);
  }

  Future<void> update({String id}) {
    return todoRespository.update(id: id);
  }

  Future<Todos> getTodos() => todoRespository.getTodos();
}

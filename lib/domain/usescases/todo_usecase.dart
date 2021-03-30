import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<void> deleteTodoById({String id}) async {
    await todoRespository.deleteTodoById(id: id);
  }
}

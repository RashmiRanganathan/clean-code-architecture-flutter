import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';

import '../../data/models/todo_model.dart';
import '../entities/todo_entity.dart';

class Todousecase {
  final TodoRespository todoRespository;

  Todousecase({this.todoRespository});

  Future<void> deleteTodoById({String id}) async {
    await todoRespository.deleteTodoById(id: id);
  }

  Future<void> update({TodoEntity todoEntity}) {
    TodoModel model = todoEntity.todoModel();
    return todoRespository.update(model);
  }
}

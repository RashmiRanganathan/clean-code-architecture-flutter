import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {

  TodoModel({String description, bool completed = false}) : super(description: description, completed: completed);

  TodoEntity toEntity() {
    return TodoEntity(description: description, completed: completed);
  }
  
}

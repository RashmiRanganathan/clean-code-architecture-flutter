import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';

class TodoModel extends TodoEntity {
  String description;

  TodoModel({String description}) : super(description: description);
}

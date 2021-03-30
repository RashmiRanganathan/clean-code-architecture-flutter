import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:hive/hive.dart';
import 'package:clean_code_architecture_flutter/common/constants/local_database_type_constants.dart';

part 'todo_table.g.dart';

@HiveType(typeId: HiveTypeIdConstants.customerTableId)
class TodoTable extends TodoModel {
  @HiveField(1)
  String description;

  @HiveField(2)
  bool completed;

  TodoTable({this.description, this.completed})
      : super(description: description, completed: completed);

  factory TodoTable.fromModel(TodoModel model) =>
      TodoTable(description: model.description, completed: model.completed);
}

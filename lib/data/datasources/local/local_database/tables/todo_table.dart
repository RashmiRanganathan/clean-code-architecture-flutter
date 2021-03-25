import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:hive/hive.dart';
import 'package:clean_code_architecture_flutter/common/constants/local_database_type_constants.dart';

part 'todo_table.g.dart';

@HiveType(typeId: HiveTypeIdConstants.customerTableId)
class TodoTable extends TodoModel {
  @HiveField(1)
  String id;

  @HiveField(2)
  String description;

  @HiveField(3)
  bool completed;

  TodoTable({this.id, this.description, this.completed})
      : super(
          id: id,
          description: description,
          completed: completed,
        );

  factory TodoTable.fromModel(TodoModel model) => TodoTable(
        id: model.id,
        description: model.description,
        completed: model.completed,
      );

  static TodoModel toModel(TodoTable table) => TodoModel(
        id: table.id,
        description: table.description,
        completed: table.completed,
      );
}

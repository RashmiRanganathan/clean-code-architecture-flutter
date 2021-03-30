import 'package:clean_code_architecture_flutter/common/constants/local_database_type_constants.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/base_local_database.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/tables/todo_table.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';

class TodoLocalDatasource extends BaseLocalDataSource<TodoTable, TodoModel> {
  TodoLocalDatasource() : super(boxName: HiveTableNameConstants.todoTableName);

  @override
  Future<List<TodoModel>> getFormattedData() async {
    List<TodoModel> todos = [TodoModel(description: 'Todo1'), TodoModel(description: 'Todo1')];
    return todos;
  }
}

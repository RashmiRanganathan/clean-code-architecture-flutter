import 'package:test/test.dart';
import 'package:hive/hive.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/tables/todo_table.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import '__mock__/todo_table_data.dart';

void main() {
  group('province local datasource', () {
    const baseLocation = './local_database_test_files/';
    Hive.init(baseLocation);

    TodoLocalDatasource todoLocalDatasource;
    Box box;

    setUp(() async {
      todoLocalDatasource = TodoLocalDatasource();
      await todoLocalDatasource.deleteAll();
      box = await todoLocalDatasource.boxInstance;
    });

    tearDown(() async {
      await box.clear();
      Injector.container?.clear();
    });

    test(
        'should return todo items when getFormattedData is called. '
        'Given that box contains one record', () async {
      // Given
      await box.add(todoTable1);

      // When
      final List<TodoModel> todoTableList =
          await todoLocalDatasource.getFormattedData();

      // Then
      expect(todoTableList.length, 1);
      expect(todoTableList[0].id, todoTable1.id);
    });
    test(
        'box should contain one record '
        'when insertOrUpdateAll is called with one item', () async {
      // When
      await todoLocalDatasource.insertOrUpdateAll([todoTable1]);

      // Then
      expect(box.toMap().length, 1);
      expect(box.toMap().containsKey(todoTable1.id), true);

      final TodoTable todoTable = box.toMap().values.toList()[0];
      expect(todoTable.id, todoTable.id);
    });

    test(
        'box should contain one record '
        'when insertOrUpdateItem is called with one item', () async {
      // When
      await todoLocalDatasource.insertOrUpdateItem(todoTable1);

      // Then
      expect(box.toMap().length, 1);
      expect(box.toMap().containsKey(todoTable1.id), true);

      final TodoTable todoTable = box.toMap().values.toList()[0];
      expect(todoTable.id, todoTable.id);
    });
  });
}

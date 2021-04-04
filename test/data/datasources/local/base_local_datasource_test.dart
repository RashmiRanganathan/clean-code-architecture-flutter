import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:hive/hive.dart';
import 'package:test/test.dart';

import '../../../common/utils/__mock__/sample_table.dart';
import '../../../common/utils/__mock__/sample_table_mock.dart';
import '__mock__/base_local_datasource_mock.dart';

void main() {
  const baseLocation = './local_database_test_files/';
  group('Base local datasource', () {
    Hive.init(baseLocation);
    ExtendedLocalDataSource extendedLocalDataSource;
    final Map<String, SampleTable> items = {
      '1': sampleTable1,
      '2': sampleTable2,
    };

    group('CRUD function', () {
      Box box;
      setUp(() async {
        extendedLocalDataSource = ExtendedLocalDataSource();
        await extendedLocalDataSource.deleteAll();
        box = await extendedLocalDataSource.boxInstance;
      });

      tearDown(() async {
        if (box.isOpen) {
          await box.clear();
        }
        Injector.container?.clear();
      });

      test('should return list of items when getAll is called', () async {
        // Given
        final expectedResult = [sampleTable1, sampleTable2];
        await box.putAll(items);

        // When
        final List result = await extendedLocalDataSource.getAll();

        // Then
        expect(result, expectedResult);
      });

      test('should return item when getOne is called when key', () async {
        // Given
        await box.putAll(items);

        // When
        final SampleTable result = await extendedLocalDataSource.get('1');

        // Then
        expect(result, items['1']);
      });

      test('should insert items when putAll is called', () async {
        // When
        await extendedLocalDataSource.putAll(items);

        // Then
        expect(box.toMap(), items);
      });

      test('should delete item when delete is called with key', () async {
        // Given
        await box.putAll(items);

        // When
        await extendedLocalDataSource.delete('1');

        // Then
        expect(box.toMap().values.toList(), [sampleTable2]);
      });

      test('should delete item when deleteAll is called with key', () async {
        // Given
        await box.putAll(items);

        // When
        await extendedLocalDataSource.deleteAll();

        // Then
        expect(box.toMap().values.toList(), []);
      });

      test('should get all keys', () async {
        // Given
        await box.putAll(items);

        // When
        final List<String> keys = await extendedLocalDataSource.keys;

        // Then
        expect(keys, items.keys);
      });

      test('should return empty list when box empty', () async {
        // Given

        // When
        final List<String> keys = await extendedLocalDataSource.keys;

        // Then
        expect(keys, isEmpty);
      });
    });
  });
}

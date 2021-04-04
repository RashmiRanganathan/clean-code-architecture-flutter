import 'package:flutter_test/flutter_test.dart';

import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:clean_code_architecture_flutter/common/utils/database_util.dart';
import '../../__setup__/path_provider_mock.dart';
import '__mock__/sample_adapter.dart';
import '__mock__/sample_table_mock.dart';

/// Please maintain the test in order to test HIVE
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Database util:', () {
    const String boxName = 'database_util_test';
    const baseLocation = './local_database_test_files/';

    group('initDatabase:', () {
      test('should insert item when Hive is initiated', () async {
        // Given
        const String data = 'a';
        setupPathProviderMock(baseLocation);
        await DatabaseUtil.initDatabase();

        // When
        final box = await Hive.openBox(boxName);
        await box.add(data);

        // Then
        expect(box.toMap().values.toList(), [data]);
        await Hive.box(boxName).clear();
      });
    });

    group('registerAdapter:', () {
      setUp(() {
        Hive.init(baseLocation);
      });

      tearDown(() {
        Hive.box(boxName).clear();
      });
      test(
          'should throw error while inserting a record'
          'when adapter is not registered', () async {
        // Given
        Error error;

        // When
        try {
          final Box box = await Hive.openBox(boxName);
          await box.add(sampleTable1);
        } catch (e) {
          error = e;
        }

        // Then
        expect(error.runtimeType, HiveError);
        expect(error.toString().contains('register an adapter'), true);
      });

      test('should insert record when adapter is registered', () async {
        // Given
        final Box box = await Hive.openBox(boxName);

        // When
        DatabaseUtil.registerAdapter(SampleTableAdapter());
        await box.add(sampleTable1);

        // Then
        expect(box.toMap().values.toList(), [sampleTable1]);
      });
    });
  });
}

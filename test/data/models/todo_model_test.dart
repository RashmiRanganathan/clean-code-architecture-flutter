import 'package:clean_code_architecture_flutter/data/models/todo_model.dart';
import 'package:test/test.dart';

import '../repositories/__mock__/todo_json_data.dart';

void main() {
  group('Interest Rate Model', () {
    test('should init from list json', () {
      // When
      final List<TodoModel> todoModel = TodoModel.fromJsonList([todoJson]);
      // Then
      expect(todoModel.length, 1);
    });

    test('should init from json', () {
      // When
      final TodoModel todoModel = TodoModel.fromJson(todoJson);
      // Then
      expect(todoModel.description, todoJson['description']);
    });
  });
}

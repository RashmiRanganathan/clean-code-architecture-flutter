import 'package:clean_code_architecture_flutter/domain/entities/todo_entity.dart';
import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFunction<T> extends Mock {
  void callback();
  void callbackWithEntity(TodoEntity todo);
}

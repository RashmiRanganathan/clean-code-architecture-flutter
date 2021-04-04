import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockFunction<T> extends Mock {
  void callback();
  void callbackWithString(String description);
}

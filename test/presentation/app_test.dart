import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_code_architecture_flutter/presentation/app.dart';

void main() {
  testWidgets('render app when loaded', (WidgetTester tester) async {
    // when
    await tester.pumpWidget(App());

    // Then
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}

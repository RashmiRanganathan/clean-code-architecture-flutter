import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_item.dart';

import '../../../../../__setup__/navigation_mock.dart';
import '../../../../../__setup__/wrapper.dart';
import '../../../../../domain/entities/__mock__/todo_entity_data.dart';

void main() {
  MockNavigatorObserver mockObserver;
  Function onUpdate;
  Function onDelete;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    onUpdate = MockFunction().callback;
    onDelete = MockFunction().callback;
  });

  testWidgets('should call onUpdate on click of icon',
      (WidgetTester tester) async {
    // when
    await tester.pumpWidget(wrapWidgetWithScaffold(
        TodoItem(
          todo: todoEntity1,
          onUpdate: onUpdate,
          onDelete: onDelete,
        ),
        mockObserver));

    final button = find.byKey(ValueKey('${todoEntity1.id}_icon'));

    // Then
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(Dismissible), findsOneWidget);
    expect(find.text(todoEntity1.description), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(button, findsOneWidget);

    // When
    await tester.tap(button);

    // Then
    verify(onUpdate()).called(1);
  });

  testWidgets('should call onDelete on dismiss', (WidgetTester tester) async {
    // when
    await tester.pumpWidget(wrapWidgetWithScaffold(
        TodoItem(
          todo: todoEntity1..completed = true,
          onUpdate: onUpdate,
          onDelete: onDelete,
        ),
        mockObserver));

    final widget = find.byKey(ValueKey(todoEntity1.id));

    // Then
    expect(find.byType(ListTile), findsOneWidget);
    expect(find.byType(Dismissible), findsOneWidget);
    expect(find.text(todoEntity1.description), findsOneWidget);
    expect(find.byType(IconButton), findsOneWidget);
    expect(widget, findsOneWidget);

    // When
    await tester.drag(widget, const Offset(-1000.0, 0.0));
    await tester.pumpAndSettle();

    // Then
    verify(onDelete()).called(1);
  });
}

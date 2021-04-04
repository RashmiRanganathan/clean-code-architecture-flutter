import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/create_todo/create_todo_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/create_todo/create_todo_screen.dart';
import '../../../../__setup__/navigation_mock.dart';
import '../../../../__setup__/wrapper.dart';

void main() {
  MockNavigatorObserver mockObserver;
  Function onCreate;
  setUp(() {
    mockObserver = MockNavigatorObserver();
    onCreate = MockFunction().callbackWithEntity;
  });

  testWidgets('Should call oncreate function on tap ',
      (WidgetTester tester) async {
    // when
    await tester.pumpWidget(wrapWidget(
        CreateTodoScreen(
          onCreate: onCreate,
        ),
        mockObserver));
    final widget = find.byKey(CreateTodoConstants.descriptionFieldKey);
    final button = find.byKey(CreateTodoConstants.createTodoButton);

    // Then
    expect(find.text('Create Todo'), findsOneWidget);
    expect(widget, findsOneWidget);

    // When
    await tester.enterText(widget, 'create todo app');
    await tester.tap(button);

    // Then
    verify(onCreate(any)).called(1);
  });
}

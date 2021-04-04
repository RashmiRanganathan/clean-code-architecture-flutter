import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_list_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_item.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/todo_list_screen.dart';
import '../../../../__setup__/navigation_mock.dart';
import '../../../../__setup__/wrapper.dart';
import '../../../../domain/entities/__mock__/todo_entity_data.dart';
import '../bloc/__mock__/todo_bloc_mock.dart';

void main() {
  MockNavigatorObserver mockObserver;
  TodoBloc todoBloc;

  setUp(() {
    mockObserver = MockNavigatorObserver();
    Injector.container.registerInstance<TodoBloc>(MockTodoBloc());
    todoBloc = Injector.resolve<TodoBloc>();
  });

  tearDown(() {
    todoBloc?.close();
    Injector.container.clear();
  });

  testWidgets('should render todolist', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final button = find.byKey(ValueKey('${todoEntity1.id}_icon'));

    // Then
    expect(find.text('TODOS'), findsOneWidget);
    expect(find.byType(TodoItem), findsOneWidget);
    expect(button, findsOneWidget);
  });

  testWidgets('should navigate to create todo', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final button = find.byKey(TodoListConstants.createTodoIcon);
    await tester.tap(button);

    // Then
    verify(mockObserver.didPush(any, any));
  });

  testWidgets('should add onUpdate event', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final button = find.byKey(TodoListConstants.createTodoIcon);
    await tester.tap(button);

    // Then
    verify(mockObserver.didPush(any, any));
  });
}

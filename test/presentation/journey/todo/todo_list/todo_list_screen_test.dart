import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
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
    when(todoBloc.state)
        .thenAnswer((_) => LoadedTodos(todos: [todoEntity1, todoEntity2]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final button = find.byKey(ValueKey('${todoEntity1.id}_icon'));

    // Then
    expect(find.text('TODOS'), findsOneWidget);
    expect(find.byType(TodoItem), findsNWidgets(2));
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

  testWidgets('should show add todo button', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: const []));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final widget = find.byKey(TodoListConstants.createTodoButton);

    // Then
    expect(widget, findsOneWidget);

    // When
    await tester.tap(widget);

    // Then
    verify(mockObserver.didPush(any, any));
  });

  testWidgets('should refresh screen on pull', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final widget = find.byType(RefreshIndicator);

    // Then
    expect(widget, findsOneWidget);

    // When
    await tester.drag(widget, const Offset(0.0, 1000));
    await tester.pumpAndSettle();

    // Then
    verify(todoBloc.add(FetchTodos(fromLocal: false))).called(1);
  });

  testWidgets('should show error screen ', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => ErrorTodos());
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final widget = find.text('Errored');

    // Then
    expect(widget, findsOneWidget);
  });

  testWidgets('should show empty screen on intial state',
      (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => InitialTodos());
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final widget = find.byType(Container);

    // Then
    expect(widget, findsOneWidget);
  });

  // testWidgets('should show loading screen ', (WidgetTester tester) async {
  //   // when
  //   when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
  //   await tester.pumpWidget(wrapWidget(
  //     TodoListScreen(),
  //     mockObserver,
  //   ));
  //   await tester.pumpAndSettle();

  //   final widget = find.byType(CircularProgressIndicator);
  //   // Then
  //   expect(widget, findsOneWidget);
  // });
  //
  testWidgets('should add delete event', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final widget = find.byWidgetPredicate((Widget widget) =>
        widget is TodoItem && widget.key == ValueKey('${todoEntity1.id}_item'));

    await tester.drag(widget, const Offset(-1000.0, 0.0));
    await tester.pumpAndSettle();

    verify(todoBloc.add(FetchTodos())).called(1);
    verify(todoBloc.add(DeleteTodo(id: todoEntity1.id))).called(1);
  });

  testWidgets('should add update event', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    await tester.pumpWidget(wrapWidget(
      TodoListScreen(),
      mockObserver,
    ));

    final button = find.byKey(ValueKey('${todoEntity1.id}_icon'));

    await tester.tap(button);

    verify(todoBloc.add(FetchTodos())).called(1);
    verify(todoBloc.add(UpdateTodo(id: todoEntity1.id))).called(1);
  });
}

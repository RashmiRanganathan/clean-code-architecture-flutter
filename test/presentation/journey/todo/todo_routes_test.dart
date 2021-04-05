import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/presentation/app.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/dashboard/dashboard_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/create_todo/create_todo_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_list/widgets/todo_list_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
import '../../../domain/entities/__mock__/todo_entity_data.dart';
import 'bloc/__mock__/todo_bloc_mock.dart';

void main() {
  TodoBloc todoBloc;

  setUp(() {
    Injector.container.registerInstance<TodoBloc>(MockTodoBloc());
    todoBloc = Injector.resolve<TodoBloc>();
  });

  tearDown(() {
    todoBloc?.close();
    Injector.container.clear();
  });

  testWidgets('should add todo', (WidgetTester tester) async {
    // when
    when(todoBloc.state).thenAnswer((_) => LoadedTodos(todos: [todoEntity1]));
    final gotoTodoList =
        find.byKey(const ValueKey(DashboardConstants.elevatedButtonKey));
    final button = find.byKey(CreateTodoConstants.createTodoButton);
    final widget = find.byKey(CreateTodoConstants.descriptionFieldKey);
    final gotoTodoCreate = find.byKey(TodoListConstants.createTodoIcon);
    await tester.pumpWidget(App());

    expect(gotoTodoList, findsOneWidget);
    await tester.tap(gotoTodoList);
    await tester.pumpAndSettle();

    expect(gotoTodoCreate, findsOneWidget);
    await tester.tap(gotoTodoCreate);
    await tester.pumpAndSettle();

    await tester.enterText(widget, 'write testcase');
    await tester.tap(button);

    // Then
    verify(todoBloc.add(AddTodo(description: 'write testcase'))).called(1);
  });
}

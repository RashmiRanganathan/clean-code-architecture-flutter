// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
// import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_bloc.dart';
// import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
// import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_event.dart';
// import 'package:clean_code_architecture_flutter/presentation/journey/todo/bloc/todo_state.dart';
// import '../../../../__setup__/base_test_bloc.dart';
// import '../../../../domain/entities/__mock__/todo_entity_data.dart';
// import '../../../../domain/usecases/__mock__/todo_usecase_mock.dart';

void main() {
//   final BaseBlocTest<TodoBloc, TodoEvent, TodoState> todoBlocTest =
//       BaseBlocTest<TodoBloc, TodoEvent, TodoState>();
//   TodoUsecase todoUsecase;
//   TodoBloc todoBloc;

//   setUp(() {
//     todoUsecase = MockTodoUsecase();
//     todoBloc = TodoBloc(todoUsecase: todoUsecase);
//   });

//   tearDown(() {
//     todoBloc?.close();
//     Injector.container.clear();
//   });
//   group('TodoBloc', () {
//     todoBlocTest
//       ..test('initial state should be Intial state',
//           build: () => todoBloc,
//           expect: [
//             isA<InitialTodos>(),
//           ],
//           verify: () async {
//             verifyNoMoreInteractions(todoUsecase);
//           })
//       ..test('should not do any thing when flag is disabled',
//           build: () => todoBloc,
//           act: (bloc) async {
//             when(todoUsecase.getAll()).thenAnswer((_) async => [todoEntity1]);
//             bloc.add(FetchTodos());
//           },
//           expect: [
//             isA<InitialTodos>(),
//             isA<LoadingTodos>(),
//             isA<LoadedTodos>(),
//           ],
//           verify: () async {
//             verify(todoUsecase.getAll()).called(1);
//           })
//       ..test('should uupdate todo',
//           build: () => todoBloc,
//           act: (bloc) async {
//             when(todoUsecase.getAll()).thenAnswer((_) async => [todoEntity1]);
//             when(todoUsecase.update(todoEntity1Completed))
//                 .thenAnswer((_) async => todoEntity1Completed);
//             bloc..add(FetchTodos())..add(UpdateTodo(id: todoEntity1.id));
//           },
//           expect: [
//             isA<InitialTodos>(),
//             isA<LoadingTodos>(),
//             isA<LoadedTodos>(),
//             isA<LoadingTodos>(),
//             isA<LoadedTodos>(),
//           ],
//           verify: () async {
//             verify(todoUsecase.getAll()).called(1);
//             verify(todoUsecase.update(todoEntity1Completed)).called(1);
//           })
//       ..test('should delete todo',
//           build: () => todoBloc,
//           act: (bloc) async {
//             when(todoUsecase.getAll()).thenAnswer((_) async => [todoEntity1]);
//             when(todoUsecase.delete(todoEntity1.id))
//                 .thenAnswer((_) async => null);
//             bloc..add(FetchTodos())..add(DeleteTodo(id: todoEntity1.id));
//           },
//           expect: [
//             isA<InitialTodos>(),
//             isA<LoadingTodos>(),
//             isA<LoadedTodos>(),
//             isA<LoadingTodos>(),
//             isA<LoadedTodos>(),
//           ],
//           verify: () async {
//             verify(todoUsecase.getAll()).called(1);
//             verify(todoUsecase.delete(todoEntity1.id)).called(1);
//           });
//   });
}

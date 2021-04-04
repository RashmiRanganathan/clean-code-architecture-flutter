import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/domain/repositories/todo_repository.dart';
import 'package:clean_code_architecture_flutter/domain/usescases/todo_usecase.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';

import '../../data/models/__mock__/todo_model_data.dart';
import '../../data/repositories/__mock__/todo_repository_mock.dart';
import '../entities/__mock__/todo_entity_data.dart';

void main() {
  TodoRepository todoRepository = MockTodoRepository();
  TodoUsecase todoUsecase;

  setUp(
    () {
      Injector.container.registerInstance<TodoRepository>(MockTodoRepository());
      todoRepository = Injector.resolve<TodoRepository>();

      todoUsecase = TodoUsecase(
        todoRepository: todoRepository,
      );
    },
  );

  tearDown(
    () {
      Injector.container.clear();
    },
  );

  group('todo usecase', () {
    group('get all todos', () {
      test('Should call todo respository', () async {
        when(todoRepository.getAll()).thenAnswer((_) async => [todoEntity1]);

        //when
        final result = await todoUsecase.getAll();

        //then
        expect(result.length, 1);
        expect(result[0].description, todoEntity1.description);
        verify(todoRepository.getAll()).called(1);
      });
    });
    group('create todo', () {
      test('Should call todo Repository', () async {
        when(todoRepository.create(any)).thenAnswer((_) async => todoEntity1);

        //when
        final result = await todoUsecase.create(todoEntity1);

        //then
        expect(result.description, todoEntity1.description);
        verify(todoRepository.create(any)).called(1);
      });
    });

    group('update todo', () {
      test('Should call todo Repository', () async {
        when(todoRepository.update(any)).thenAnswer((_) async => todoEntity1);

        //when
        final result = await todoUsecase.update(todoEntity1);

        //then
        expect(result.completed, todoModel1.completed);
        verify(todoRepository.update(any)).called(1);
      });
    });

    group('delete todo', () {
      test('Should call todo Repository', () async {
        when(todoRepository.delete(todoEntity1.id))
            .thenAnswer((_) async => null);

        //when
        await todoUsecase.delete(todoEntity1.id);

        //then

        verify(todoRepository.delete(todoEntity1.id)).called(1);
      });
    });
  });
}

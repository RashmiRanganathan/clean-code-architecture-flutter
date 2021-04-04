import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/data/datasources/local/local_database/todo_local_datasource.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import 'package:clean_code_architecture_flutter/data/repositories/todo_repository_impl.dart';

import '../datasources/local/__mock__/todo_local_datasource_mock.dart';
import '../datasources/remote/__mock__/todo_remote_datasource_mock.dart';
import '../models/__mock__/todo_model_data.dart';

void main() {
  TodoRepositoryImpl todoRepositoryImpl;
  TodoLocalDatasource todoLocalDatasource = MockTodoLocalDatasource();
  TodoRemoteDatasource todoRemoteDatasource = MockTodoRemoteDatasource();

  setUp(
    () {
      Injector.container
          .registerInstance<TodoRemoteDatasource>(MockTodoRemoteDatasource());
      Injector.container
          .registerInstance<TodoLocalDatasource>(MockTodoLocalDatasource());
      todoRemoteDatasource = Injector.resolve<TodoRemoteDatasource>();
      todoLocalDatasource = Injector.resolve<TodoLocalDatasource>();

      todoRepositoryImpl = TodoRepositoryImpl(
        todoLocalDatasource: todoLocalDatasource,
        todoRemoteDatasource: todoRemoteDatasource,
      );
    },
  );

  tearDown(
    () {
      Injector.container.clear();
    },
  );

  group('todo Repository Impl Test', () {
    group('get all todos', () {
      test('Should get all todos from local datasource', () async {
        when(todoLocalDatasource.getFormattedData())
            .thenAnswer((_) async => [todoModel1]);

        //when
        final result = await todoRepositoryImpl.getAll();

        //then
        expect(result.length, 1);
        expect(result[0].description, todoModel1.description);
        verify(todoLocalDatasource.getFormattedData()).called(1);
        verifyNever(todoRemoteDatasource.getAll());
        verifyNever(todoLocalDatasource.deleteAll());
        verifyNever(todoLocalDatasource.insertOrUpdateAll([todoModel1]));
      });

      test('should get all todo from api when localdatasource is empty',
          () async {
        when(todoLocalDatasource.getFormattedData())
            .thenAnswer((_) async => []);
        when(todoLocalDatasource.deleteAll()).thenAnswer((_) async => null);
        when(todoLocalDatasource.insertOrUpdateAll([todoModel1]))
            .thenAnswer((_) async => null);
        when(todoRemoteDatasource.getAll())
            .thenAnswer((_) async => [todoModel1]);

        //when
        final result = await todoRepositoryImpl.getAll();

        //then
        expect(result.length, 1);
        expect(result[0].description, todoModel1.description);
        verify(todoLocalDatasource.getFormattedData()).called(1);
        verify(todoRemoteDatasource.getAll()).called(1);
        verify(todoLocalDatasource.deleteAll()).called(1);
        verify(todoLocalDatasource.insertOrUpdateAll([todoModel1])).called(1);
      });
    });
    group('create todo', () {
      test('should call api and create todo in local datasource', () async {
        when(todoLocalDatasource.insertOrUpdateItem(todoModel1))
            .thenAnswer((_) async => null);
        when(todoRemoteDatasource.create(todoModel1))
            .thenAnswer((_) async => todoModel1);

        //when
        final result = await todoRepositoryImpl.create(todoModel1);

        //then
        expect(result.description, todoModel1.description);
        verify(todoLocalDatasource.insertOrUpdateItem(todoModel1)).called(1);
        verify(todoRemoteDatasource.create(todoModel1)).called(1);
      });

      test('should call api only when response is null', () async {
        when(todoRemoteDatasource.create(todoModel1))
            .thenAnswer((_) async => null);

        //when
        final result = await todoRepositoryImpl.create(todoModel1);

        //then
        expect(result, null);
        verify(todoRemoteDatasource.create(todoModel1)).called(1);
        verifyNever(todoLocalDatasource.insertOrUpdateItem(todoModel1));
      });
    });

    group('update todo', () {
      test('should call api and update todo in local datasource', () async {
        when(todoLocalDatasource.insertOrUpdateItem(todoModel1))
            .thenAnswer((_) async => null);
        when(todoRemoteDatasource.update(todoModel1))
            .thenAnswer((_) async => todoModel1);

        //when
        final result = await todoRepositoryImpl.update(todoModel1);

        //then
        expect(result.description, todoModel1.description);
        verify(todoLocalDatasource.insertOrUpdateItem(todoModel1)).called(1);
        verify(todoRemoteDatasource.update(todoModel1)).called(1);
      });

      test('should call api only when response is null', () async {
        when(todoRemoteDatasource.create(todoModel1))
            .thenAnswer((_) async => null);

        //when
        final result = await todoRepositoryImpl.create(todoModel1);

        //then
        expect(result, null);
        verify(todoRemoteDatasource.create(todoModel1)).called(1);
        verifyNever(todoLocalDatasource.insertOrUpdateItem(todoModel1));
      });
    });

    group('delete todo', () {
      test('should call api and delete todo in local datasource', () async {
        when(todoLocalDatasource.insertOrUpdateItem(todoModel1))
            .thenAnswer((_) async => null);
        when(todoRemoteDatasource.delete(todoModel1.id))
            .thenAnswer((_) async => todoModel1);

        //when
        await todoRepositoryImpl.delete(todoModel1.id);

        //then
        verify(todoLocalDatasource.delete(todoModel1.id)).called(1);
        verify(todoRemoteDatasource.delete(todoModel1.id)).called(1);
      });

      test('should call api only when response is null', () async {
        when(todoRemoteDatasource.delete(todoModel1.id))
            .thenAnswer((_) async => null);

        //when
        await todoRepositoryImpl.delete(todoModel1.id);

        //then
        verify(todoRemoteDatasource.delete(todoModel1.id)).called(1);
        verifyNever(todoLocalDatasource.delete(todoModel1.id));
      });
    });
  });
}

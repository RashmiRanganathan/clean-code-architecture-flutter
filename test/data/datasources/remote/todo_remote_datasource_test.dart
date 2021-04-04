import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/data/datasources/remote/constants/todo_remote_datasource_constants.dart';
import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/common/injector/injector.dart';
import 'package:clean_code_architecture_flutter/data/datasources/remote/todo_remote_datasource.dart';
import '../../models/__mock__/todo_model_data.dart';
import '../../repositories/__mock__/todo_json_data.dart';
import '__mock__/http_client_mock.dart';

void main() {
  HttpClient httpClient = MockHttpClient();
  TodoRemoteDatasource todoRemoteDatasource;

  setUp(
    () {
      Injector.container.registerInstance<HttpClient>(MockHttpClient());
      httpClient = Injector.resolve<HttpClient>();

      todoRemoteDatasource = TodoRemoteDatasource(
        httpClient: httpClient,
      );
    },
  );

  tearDown(
    () {
      Injector.container.clear();
    },
  );

  group('todo remote datasource', () {
    group('get all todos', () {
      test('Should call httpclient', () async {
        when(httpClient.get(TodoEndpoints.getCreateUpdateDeletePath))
            .thenAnswer((_) async => [todoJson]);

        //when
        final result = await todoRemoteDatasource.getAll();

        //then
        expect(result.length, 1);
        expect(result[0].description, todoModel1.description);
        verify(httpClient.get(TodoEndpoints.getCreateUpdateDeletePath))
            .called(1);
      });
    });
    group('create todo', () {
      test('Should call httpclient', () async {
        when(httpClient.post(TodoEndpoints.getCreateUpdateDeletePath, todoJson))
            .thenAnswer((_) async => todoJson);

        //when
        final result = await todoRemoteDatasource.create(todoModel1);

        //then
        expect(result.description, todoModel1.description);
        verify(httpClient.post(
                TodoEndpoints.getCreateUpdateDeletePath, todoJson))
            .called(1);
      });
    });

    group('update todo', () {
      test('Should call httpclient', () async {
        when(httpClient.put(
                '${TodoEndpoints.getCreateUpdateDeletePath}/${todoModel1.id}',
                todoJson))
            .thenAnswer((_) async => todoJson);

        //when
        final result = await todoRemoteDatasource.update(todoModel1);

        //then
        expect(result.completed, todoModel1.completed);
        verify(httpClient.put(
          '${TodoEndpoints.getCreateUpdateDeletePath}/${todoModel1.id}',
          todoJson,
        )).called(1);
      });
    });

    group('delete todo', () {
      test('Should call httpclient', () async {
        when(httpClient.delete(
          '${TodoEndpoints.getCreateUpdateDeletePath}/${todoModel1.id}',
        )).thenAnswer((_) async => todoJsonResponse);

        //when
        final result = await todoRemoteDatasource.delete(todoModel1.id);

        //then
        expect(result.description, todoModel1.description);
        verify(httpClient.delete(
          '${TodoEndpoints.getCreateUpdateDeletePath}/${todoModel1.id}',
        )).called(1);
      });
    });
  });
}

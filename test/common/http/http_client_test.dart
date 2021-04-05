import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/common/http/http_client.dart';
import 'package:clean_code_architecture_flutter/common/configs/configuration.dart';

import '__mock__/http_client_data.dart';
import '__mock__/http_client_mock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  HttpClient httpClient;
  MockClient client;

  setUpAll(() async {
    client = MockClient();
    httpClient = HttpClient(host: Configuration.host, client: client);
  });

  tearDownAll(() {});

  group('Http client', () {
    test('Should call get', () async {
      //Given
      when(client.get(
        Uri.parse('${Configuration.host}/something'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(jsonString, 200));

      // when
      final result = await httpClient.get('/something');

      // Then
      expect(result, extractedJsonData);
    });

    test('Should call get for image', () async {
      //Given
      when(client.get(
        '/image.png',
      )).thenAnswer((_) async => Response.bytes([], 200));

      // when
      final result = await httpClient.getImage('/image.png');

      // Then
      expect(result.runtimeType, Response);
    });

    test('Should call post', () async {
      //Given
      when(client.post(
        Uri.parse('${Configuration.host}/something'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(jsonString, 201));

      // when
      final result = await httpClient.post('/something', extractedJsonData);

      // Then
      expect(result, extractedJsonData);
    });

    test('Should call put', () async {
      //Given
      when(client.put(
        Uri.parse('${Configuration.host}/something'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response('', 204));

      // when
      final result = await httpClient.put('/something', extractedJsonData);

      // Then
      expect(result, null);
    });

    test('Should call put', () async {
      //Given
      when(client.patch(
        Uri.parse('${Configuration.host}/something'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response('', 204));

      // when
      final result = await httpClient.patch('/something', extractedJsonData);

      // Then
      expect(result, null);
    });

    test('Should call delete', () async {
      //Given
      when(client.delete(
        Uri.parse('${Configuration.host}/something/1'),
        headers: anyNamed('headers'),
      )).thenAnswer((_) async => Response(jsonString, 200));

      // when
      final result = await httpClient.delete('/something/1');

      // Then
      expect(result, extractedJsonData);
    });
  });
}

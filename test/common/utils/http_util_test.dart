import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

import 'package:clean_code_architecture_flutter/common/constants/http_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/bad_request_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/forbidden_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/server_error_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/unauthorized_exception.dart';
import 'package:clean_code_architecture_flutter/common/utils/http_utils.dart';

class Request extends BaseRequest {
  Request(String method, Uri url) : super(method, url);
}

class RequestFn extends Mock implements Function {
  Future<Response> withBody(
    dynamic url, {
    Map<String, String> headers = const {},
    dynamic body,
  });

  Future<Response> withoutBody(
    dynamic url, {
    Map<String, String> headers = const {},
  });
}

void main() {
  group('HttpUtil', () {
    group('encodeRequestBody', () {
      test(
        'should encode the data in json format '
        'when content type is json',
        () {
          // given
          final Map<String, String> data = {'k1': 'v1'};

          // when
          final dynamic result =
              HttpUtil.encodeRequestBody(data, HttpConstants.jsonContentType);
          final dynamic decoded = json.decode(utf8.decode(result));

          // then
          expect(decoded['k1'], 'v1');
        },
      );

      test(
        'should not encode to any type when content type is not json',
        () {
          // given
          final Map<String, String> data = {'k1': 'v1'};

          // when
          final dynamic result =
              HttpUtil.encodeRequestBody(data, 'some-random-type');

          // then
          expect(result['k1'], 'v1');
        },
      );
    });

    group('getResponse', () {
      const jsonString = '{"data": "v1"}';
      group('when 200 status code', () {
        test('should decode json and return body', () {
          // given
          final Response response = Response(jsonString, 200);

          // when
          final dynamic result = HttpUtil.getResponse(response);

          // then
          expect(result, 'v1');
        });
      });

      group('when 201 status code', () {
        test('should decode json and return body', () {
          // given
          final Response response = Response(jsonString, 201);

          // when
          final dynamic result = HttpUtil.getResponse(response);

          // then
          expect(result, 'v1');
        });
      });
      group('when 204 status code', () {
        test('should return null in body', () {
          // given
          final Response response = Response(jsonString, 204);

          // when
          final dynamic result = HttpUtil.getResponse(
            response,
          );

          // then
          expect(result, null);
        });
      });
      group('when 400 status code', () {
        test('should throw BadRequestException', () {
          // given
          final Response response =
              Response('{"error": {"some": "som2"}}', 400);

          // when
          try {
            HttpUtil.getResponse(response);
          }
          // then
          catch (exception) {
            expect(exception is BadRequestException, true);
          }
        });
      });
      group('when 401 status code', () {
        test('should throw unauthorized exception ', () {
          // given
          final Response response = Response(jsonString, 401);

          // when
          try {
            HttpUtil.getResponse(response);
          }
          // then
          catch (exception) {
            expect(exception is UnauthorisedException, true);
          }
        });
      });
      group('when 403 status code', () {
        test('should throw ForbiddenException', () {
          // given
          final Response response = Response(jsonString, 403);

          // when
          try {
            HttpUtil.getResponse(response);
          }
          // then
          catch (exception) {
            expect(exception is ForbiddenException, true);
          }
        });
      });

      group('when 500 status code', () {
        test('should throw ServerErrorException', () {
          // given
          final Response response = Response(
              '{"error": { "message": "some test", "code": "test" } }', 500);

          // when
          try {
            HttpUtil.getResponse(response);
          }
          // then
          catch (exception) {
            expect(exception is ServerErrorException, true);
          }
        });
      });
    });
  });
}

import 'dart:convert';

import 'package:http/http.dart';

import 'package:clean_code_architecture_flutter/common/constants/exception_constants.dart';
import 'package:clean_code_architecture_flutter/common/constants/http_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/bad_request_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/forbidden_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/server_error_exception.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/unauthorized_exception.dart';

class HttpUtil {
  static dynamic encodeRequestBody(dynamic data, String contentType) {
    return contentType == HttpConstants.jsonContentType
        ? utf8.encode(json.encode(data))
        : data;
  }

  static String getErroredResult(dynamic result) {
    if (result['error'] is String) {
      return result['error'];
    } else if (result['message'] is String) {
      return result['message'];
    }
    return ExceptionConstants.somethingWentWrong;
  }

  static dynamic getResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final responseJson = json.decode(response.body);
        return responseJson['data'];
      case 204:
        return null;
      case 400:
        throw BadRequestException(
          getErroredResult(json.decode(response.body)),
        );
      case 401:
        throw UnauthorisedException(
          getErroredResult(json.decode(response.body)),
        );
      case 403:
        throw ForbiddenException(
          getErroredResult(json.decode(response.body)),
        );
      case 500:

      default:
        throw ServerErrorException(
          getErroredResult(json.decode(response.body)),
        );
    }
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:clean_code_architecture_flutter/common/constants/exception_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/server_error_exception.dart';

void main() {
  test('ServerErrorException', () {
    // When
    final result = ServerErrorException('message');
    // Then
    expect(result.message, 'message');
    expect(result.code, ExceptionConstants.internalServerError);
  });
}

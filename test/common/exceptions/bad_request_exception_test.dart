import 'package:flutter_test/flutter_test.dart';

import 'package:clean_code_architecture_flutter/common/constants/exception_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/bad_request_exception.dart';

void main() {
  test('BadRequestException', () {
    // When
    final result = BadRequestException('message');
    // Then
    expect(result.message, 'message');
    expect(result.code, ExceptionConstants.badRequest);
  });
}

import 'package:test/test.dart';
import 'package:clean_code_architecture_flutter/common/constants/exception_constants.dart';
import 'package:clean_code_architecture_flutter/common/exceptions/unauthorized_exception.dart';

void main() {
  test('BadRequestException', () {
    // When
    final result = UnauthorisedException('message');
    // Then
    expect(result.message, 'message');
    expect(result.code, ExceptionConstants.unauthorized);
  });
}

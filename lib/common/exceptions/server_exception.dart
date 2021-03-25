import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  final String code;
  final String message;

  ServerException({@required this.message, this.code});
}

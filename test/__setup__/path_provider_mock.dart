import 'package:flutter/services.dart';

void setupPathProviderMock(String baseLocation) {
  const MethodChannel('plugins.flutter.io/path_provider')
      .setMockMethodCallHandler(
    (MethodCall methodCall) async {
      return Future<String>.value(baseLocation);
    },
  );
}

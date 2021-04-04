import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class DatabaseUtil {
  static Future<void> initDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
  }

  ///  Register our auto generated Adapter to our Hive database
  static void registerAdapter<Type>(TypeAdapter<Type> adapter) {
    try {
      Hive.registerAdapter(adapter);
    } on HiveError catch (error) {
      debugPrint(error.toString());
    }
  }
}

import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/common/injector/injector_config.dart';
import 'package:clean_code_architecture_flutter/common/utils/database_util.dart';
import 'package:clean_code_architecture_flutter/presentation/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  InjectorConfig.setup();
  await DatabaseUtil.initDatabase();

  runApp(App());
}

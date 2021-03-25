import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/routes.dart';
import 'package:clean_code_architecture_flutter/presentation/themes/theme_data.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: appTheme(context),
      routes: Routes.getAll(),
      initialRoute: RouteList.dashbaord,
    );
  }
}

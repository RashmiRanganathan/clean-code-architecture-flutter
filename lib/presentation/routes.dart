import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/presentation/journey/todo/todo_routes.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/dashboard/dashboard_routes.dart';

class Routes {
  static Map<String, WidgetBuilder> _getCombinedRoutes() => {
        ...DashboardRoutes.getAll(),
        ...TodoRoutes.getAll(),
      };

  static Map<String, WidgetBuilder> getAll() => _getCombinedRoutes();
}

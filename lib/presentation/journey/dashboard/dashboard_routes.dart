import 'package:flutter/material.dart';

import 'package:clean_code_architecture_flutter/common/constants/route_constants.dart';
import 'package:clean_code_architecture_flutter/presentation/journey/dashboard/dashboard_screen.dart';

class DashboardRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.dashbaord: (context) => DashboardScreen(),
    };
  }
}

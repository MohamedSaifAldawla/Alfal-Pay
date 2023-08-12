import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes.dart';

class MiddleWare extends GetMiddleware {
  @override
  // ignore: overridden_fields
  int? priority = 1;

  @override
  RouteSettings? redirect(String? route) {
    if (GetStorage().read("intro") == "1") {
      return RouteSettings(name: Routes.welcome);
    }
    return null;
  }
}

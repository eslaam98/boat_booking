import 'package:boat_booking/config/router/routes.dart';
import 'package:boat_booking/utils/constants/shared_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWere extends GetMiddleware {
  @override
  int? get priority => 1;
  SharedService sharedService = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    return const RouteSettings(name: AppRoute.splashScreenPage);
  }
}

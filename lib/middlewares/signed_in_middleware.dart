import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/services/auth_service.dart';
import 'package:goal_fit/app_router.dart';

class SignedInMiddleware extends GetMiddleware {
  final AuthService _auth = Get.find<AuthService>();

  @override
  RouteSettings? redirect(String? route) {
    if (_auth.isAuthenticated) {
      return const RouteSettings(name: AppRouter.main);
    }
    return null;
  }
}

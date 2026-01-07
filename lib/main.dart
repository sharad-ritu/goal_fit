import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/app_router.dart';
import 'package:goal_fit/controllers/auth/auth_controller.dart';
import 'package:goal_fit/controllers/home/home_controller.dart';
import 'package:goal_fit/controllers/main_layout.controller.dart';
import 'package:goal_fit/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<AuthService>(() async => AuthService().init());

  Get.put(MainLayoutController(), permanent: true);
  Get.put(AuthController(), permanent: true);
  Get.put(HomeController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Goal Fit',
      initialRoute: AppRouter.initialRoute(),
      getPages: AppRouter.routes,
    );
  }
}

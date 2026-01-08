import 'package:get/get.dart';
import 'package:goal_fit/middlewares/signed_in_middleware.dart';
import 'package:goal_fit/pages/congrats/index.dart';
import 'package:goal_fit/pages/notification/index.dart';
import 'package:goal_fit/pages/privacy-policy/index.dart';
import 'package:goal_fit/pages/sign-in/index.dart';
import 'package:goal_fit/pages/sign-up/index.dart';
import 'package:goal_fit/pages/terms-of-service/index.dart';
import 'package:goal_fit/pages/workout-details/index.dart';
import 'package:goal_fit/pages/workout-tracker/index.dart';
import 'package:goal_fit/services/auth_service.dart';
import 'package:goal_fit/middlewares/auth_middleware.dart';
import 'package:goal_fit/main_layout.dart';
import 'package:goal_fit/pages/stats/index.dart';

class AppRouter {
  // Route names
  static const String root = '/';
  static const String main = '/main';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String stats = '/stats';
  static const String terms = '/terms';
  static const String privacy = '/privacy';
  static const String notifications = '/notifications';
  static const String congrats = '/congrats';
  static const String workoutTracker = '/workout-tracker';
  static const String workoutDetails = '/workout-details';

  // Initial route decision
  static String initialRoute() {
    final auth = Get.find<AuthService>();
    return auth.isAuthenticated ? main : signIn;
  }

  static final routes = <GetPage>[
    GetPage(
      name: signIn,
      page: () => const SignInPage(),
      middlewares: [SignedInMiddleware()],
    ),

    GetPage(
      name: signUp,
      page: () => const SignUpPage(),
      middlewares: [SignedInMiddleware()],
    ),

    GetPage(
      name: main,
      page: () => const MainLayout(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: stats,
      page: () => const StatisticsPage(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(name: terms, page: () => const TermsPage()),

    GetPage(name: privacy, page: () => const PrivacyPolicyPage()),

    GetPage(
      name: notifications,
      page: () => const NotificationsPage(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: congrats,
      page: () => const CongratsPage(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: workoutTracker,
      page: () => const WorkoutTrackerPage(),
      middlewares: [AuthMiddleware()],
    ),

    GetPage(
      name: workoutDetails,
      page: () => const WorkoutDetailsPage(),
      middlewares: [AuthMiddleware()],
    ),
  ];
}

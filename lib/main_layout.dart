// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:goal_fit/controllers/main_layout.controller.dart';
// import 'package:goal_fit/pages/create/index.dart';
// import 'package:goal_fit/pages/home/index.dart';
// import 'package:goal_fit/pages/profile/index.dart';

// class MainLayout extends GetView<MainLayoutController> {
//   const MainLayout({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final tabs = const [
//       _TabNav(navigatorId: 1, child: HomePage()),
//       _TabNav(navigatorId: 2, child: CreatePage()),
//       _TabNav(navigatorId: 3, child: ProfilePage()),
//     ];

//     return Obx(
//       () => Scaffold(
//         body: IndexedStack(index: controller.tabIndex.value, children: tabs),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: controller.tabIndex.value,
//           onTap: controller.changeTab,
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//             BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Create"),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TabNav extends StatelessWidget {
//   final int navigatorId;
//   final Widget child;

//   const _TabNav({required this.navigatorId, required this.child});

//   @override
//   Widget build(BuildContext context) {
//     return Navigator(
//       key: Get.nestedKey(navigatorId),
//       onGenerateRoute: (settings) {
//         return GetPageRoute(settings: settings, page: () => child);
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/app_router.dart';

import 'package:goal_fit/controllers/main_layout.controller.dart';
import 'package:goal_fit/pages/congrats/index.dart';
import 'package:goal_fit/pages/create/index.dart';
import 'package:goal_fit/pages/home/index.dart';
import 'package:goal_fit/pages/notification/index.dart';
import 'package:goal_fit/pages/profile/index.dart';
import 'package:goal_fit/pages/stats/index.dart';
import 'package:goal_fit/pages/workout-details/index.dart';
import 'package:goal_fit/pages/workout-tracker/index.dart';

class MainLayout extends GetView<MainLayoutController> {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = const [
      _TabNav(navigatorId: 1),
      _TabNav(navigatorId: 2),
      _TabNav(navigatorId: 3),
    ];

    return Obx(
      () => Scaffold(
        body: IndexedStack(index: controller.tabIndex.value, children: tabs),
        // bottomNavigationBar: BottomNavigationBar(
        //   currentIndex: controller.tabIndex.value,
        //   onTap: controller.changeTab,
        //   backgroundColor: ,
        //   items: const [
        //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        //     BottomNavigationBarItem(icon: Icon(Icons.add_box), label: "Create"),
        //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        //   ],
        // ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFBCC8D5),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 12,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFFBCC8D5),
              currentIndex: controller.tabIndex.value,
              onTap: controller.changeTab,
              selectedItemColor: const Color(0xFFC70003),
              unselectedItemColor: const Color(0xFF54585C),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled, size: 26),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_2_rounded, size: 26),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded, size: 26),
                  label: 'Create',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TabNav extends StatelessWidget {
  final int navigatorId;
  const _TabNav({required this.navigatorId});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(navigatorId),
      onGenerateRoute: (settings) {
        // HOME TAB
        if (navigatorId == 1) {
          if (settings.name == AppRouter.notifications) {
            return GetPageRoute(
              settings: settings,
              page: () => const NotificationsPage(),
            );
          }

          return GetPageRoute(settings: settings, page: () => const HomePage());
        }

        // PROFILE TAB (named routes supported here)
        if (navigatorId == 2) {
          if (settings.name == AppRouter.stats) {
            return GetPageRoute(
              settings: settings,
              page: () => const StatisticsPage(),
            );
          }

          if (settings.name == AppRouter.congrats) {
            return GetPageRoute(
              settings: settings,
              page: () => const CongratsPage(),
            );
          }

          if (settings.name == AppRouter.workoutTracker) {
            return GetPageRoute(
              settings: settings,
              page: () => const WorkoutTrackerPage(),
            );
          }

          if (settings.name == AppRouter.notifications) {
            return GetPageRoute(
              settings: settings,
              page: () => const NotificationsPage(),
            );
          }

          if (settings.name == AppRouter.workoutDetails) {
            return GetPageRoute(
              settings: settings,
              page: () => const WorkoutDetailsPage(),
            );
          }

          // default route for profile tab
          return GetPageRoute(
            settings: settings,
            page: () => const ProfilePage(),
          );
        }

        // CREATE TAB
        if (navigatorId == 3) {
          if (settings.name == AppRouter.notifications) {
            return GetPageRoute(
              settings: settings,
              page: () => const NotificationsPage(),
            );
          }

          return GetPageRoute(
            settings: settings,
            page: () => const CreatePage(),
          );
        }

        // fallback
        return GetPageRoute(
          settings: settings,
          page: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

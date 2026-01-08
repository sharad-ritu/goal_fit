import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/app_router.dart';
import 'package:goal_fit/controllers/auth/auth_controller.dart';
import 'package:goal_fit/controllers/main_layout.controller.dart';
import 'package:goal_fit/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const _green = Color(0xFFA7AB8A);
  static const _offWhite = Color(0xFFF6F1F1);

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthService>();
    final authController = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9E4E4),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          child: Column(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: _offWhite,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 10),

              Obx(() {
                final name = (auth.currentUser.value?['name'] ?? '')
                    .toString()
                    .trim();
                return Text(
                  name.isEmpty ? 'User' : name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  overflow: TextOverflow.ellipsis,
                );
              }),

              const SizedBox(height: 16),

              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                margin: EdgeInsets.only(bottom: 14),
                decoration: BoxDecoration(
                  color: _green,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.directions_walk, color: Colors.black),
                    SizedBox(width: 14),
                    Text(
                      '3333',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Steps Today',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              _MenuTile(
                icon: Icons.emoji_events_outlined,
                title: 'Achievements',
                onTap: () {
                  Get.toNamed(AppRouter.congrats, id: 2);
                },
              ),
              _MenuTile(
                icon: Icons.bar_chart_rounded,
                title: 'Statistics',
                onTap: () {
                  Get.toNamed(AppRouter.stats, id: 2);
                },
              ),
              _MenuTile(
                icon: Icons.fitness_center,
                title: 'WorkOut Tracker',
                onTap: () {
                  Get.toNamed(AppRouter.workoutTracker, id: 2);
                },
              ),
              _MenuTile(
                icon: Icons.notifications_none,
                title: 'Notifications',
                onTap: () {
                  Get.toNamed(AppRouter.notifications, id: 2);
                },
              ),
              _MenuTile(icon: Icons.music_note_outlined, title: 'Sound'),
              _MenuTile(
                icon: Icons.logout_rounded,
                title: 'Logout',
                onTap: () async {
                  await authController.signOut();
                  Get.find<MainLayoutController>().tabIndex.value = 0;
                  Get.offAllNamed(AppRouter.signIn);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({required this.icon, required this.title, this.onTap});

  static const _tileColor = Color(0xFFF6F1F1);

  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Material(
        color: _tileColor,
        borderRadius: BorderRadius.circular(28),
        elevation: 3,
        shadowColor: const Color(0x22000000),
        child: InkWell(
          borderRadius: BorderRadius.circular(28),
          onTap: onTap,
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.65),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.black87),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_circle_right_outlined,
                  size: 34,
                  color: Colors.black87,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

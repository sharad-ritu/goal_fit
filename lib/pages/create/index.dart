import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/app_router.dart';
import 'package:goal_fit/services/auth_service.dart';

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthService>();

    final items = <_WorkoutItem>[
      _WorkoutItem(
        title: 'Squats',
        imagePath: 'assets/create/create-1.png',
        color: const Color(0xFF8A92EB),
      ),
      _WorkoutItem(
        title: 'Plank',
        imagePath: 'assets/create/create-2.png',
        color: const Color(0xFFFD9AB1),
      ),
      _WorkoutItem(
        title: 'Dead Lift',
        imagePath: 'assets/create/create-3.png',
        color: const Color(0xFFFD9AB1),
      ),
      _WorkoutItem(
        title: 'Bicep Curl',
        imagePath: 'assets/create/create-4.png',
        color: const Color(0xFF73E198),
      ),
      _WorkoutItem(
        title: 'Leg Press',
        imagePath: 'assets/create/create-5.png',
        color: const Color(0xFF73E198),
      ),
      _WorkoutItem(
        title: 'Lat pulldown',
        imagePath: 'assets/create/create-6.png',
        color: const Color(0xFF1CC0ED),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9E4E4),
        surfaceTintColor: Colors.transparent,

        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.person, color: Colors.black, size: 26),
          ),
        ),

        title: Obx(() {
          final name = (auth.currentUser.value?['name'] ?? '')
              .toString()
              .trim();
          return Text(
            'Welcome Back, ${name.isEmpty ? 'User' : name}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
            overflow: TextOverflow.ellipsis,
          );
        }),

        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRouter.notifications, id: 3);
            },
            icon: const Icon(
              Icons.notifications_none,
              size: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Column(
              children: [
                const Text(
                  'Add your workout, track you success',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFFF3B30),
                  ),
                ),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    mainAxisExtent: 210,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _WorkoutCard(item: items[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  const _WorkoutCard({required this.item});

  final _WorkoutItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: item.color,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.asset(item.imagePath, fit: BoxFit.contain),
          ),

          const SizedBox(height: 16),

          Text(
            item.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class _WorkoutItem {
  final String title;
  final String imagePath;
  final Color color;

  const _WorkoutItem({
    required this.title,
    required this.imagePath,
    required this.color,
  });
}

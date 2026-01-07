import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goal_fit/app_router.dart';

class WorkoutTrackerPage extends StatelessWidget {
  const WorkoutTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF94ACFE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF85B0FF),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Workout Tracker',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF85B0FF), // lighter top
              Color(0xFF9F7BFF), // darker bottom
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  // width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 142,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Fri 20 Dec',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '45',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                    Icon(
                                      Icons.arrow_upward_outlined,
                                      size: 16,
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Bodyweight circuits',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 6),
                            // tiny progress bar
                            SizedBox(
                              width: 120,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(99),
                                ),
                                child: LinearProgressIndicator(
                                  value: 0.45,
                                  minHeight: 6,
                                  backgroundColor: Color(0xFFEDEDED),
                                  valueColor: AlwaysStoppedAnimation(
                                    Color(0xFFF6A623),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.asset(
                          'assets/img/tracker.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x11000000),
                        blurRadius: 18,
                        offset: Offset(0, -6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // "Your Workout Plan" row
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F5FF),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Your Workout Plan',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w800,
                                color: Colors.black87,
                              ),
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 34,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFF1E4D),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                                child: const Text(
                                  'Check',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Upcoming Workout title
                      Row(
                        children: [
                          const Text(
                            'Upcoming Workout',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See more',
                              style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),

                      // Upcoming card 1 (ON)
                      _UpcomingTile(
                        assetPath: 'assets/workout/push-up.png',
                        title: 'Lower-Body & Core Power',
                        subtitle: 'in 30 mins',
                        isOn: true,
                        onToggle: (_) {},
                      ),

                      const SizedBox(height: 16),

                      // Upcoming card 2 (OFF)
                      _UpcomingTile(
                        assetPath: 'assets/workout/squat.png',
                        title: 'Squats Training',
                        subtitle: 'Jan 02, 06:30 am',
                        isOn: false,
                        onToggle: (_) {},
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        'What Do You Want to Train',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const SizedBox(height: 12),

                      _TrainingCard(
                        title: 'Lower Body & Core',
                        subtitle: '7 Exercises',
                        backgroundColor: Color(0xFFE3FAEA),
                        imageAsset: 'assets/workout/squat-2.png',
                        onTap: () {
                          Get.toNamed(AppRouter.workoutDetails, id: 2);
                        },
                      ),

                      const SizedBox(height: 16),

                      _TrainingCard(
                        title: 'Flexibility',
                        subtitle: '8 Exercises',
                        backgroundColor: Color(0xFFF9E3E6),
                        imageAsset: 'assets/workout/standing.png',
                        onTap: () {
                          Get.toNamed(AppRouter.workoutDetails, id: 2);
                        },
                      ),

                      const SizedBox(height: 16),

                      _TrainingCard(
                        title: 'Cardio',
                        subtitle: '9 Exercises',
                        backgroundColor: Color(0xFFD4D8FA),
                        imageAsset: 'assets/workout/skipping.png',
                        onTap: () {
                          Get.toNamed(AppRouter.workoutDetails, id: 2);
                        },
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UpcomingTile extends StatelessWidget {
  const _UpcomingTile({
    required this.assetPath,
    required this.title,
    required this.subtitle,
    required this.isOn,
    required this.onToggle,
  });

  final String assetPath;
  final String title;
  final String subtitle;
  final bool isOn;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F1F1),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(assetPath, width: 40, height: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: isOn,
            onChanged: onToggle,
            activeThumbColor: Colors.white,
            activeTrackColor: const Color(0xFFFF1E4D),
          ),
        ],
      ),
    );
  }
}

class _TrainingCard extends StatelessWidget {
  const _TrainingCard({
    required this.title,
    required this.subtitle,
    required this.backgroundColor,
    required this.imageAsset,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final Color backgroundColor;
  final String imageAsset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Ink(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      height: 36,
                      child: ElevatedButton(
                        onPressed: onTap,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                        ),
                        child: const Text(
                          'Explore',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                imageAsset,
                width: 72,
                height: 72,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

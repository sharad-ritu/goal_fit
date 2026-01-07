import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = <_NotificationItem>[
      _NotificationItem(
        title: 'Join the 7-Day Fitness Challenge star...',
        time: '28 minutes ago',
        iconPath: 'assets/notification/notif-1.png',
      ),
      _NotificationItem(
        title: "Congrats! You've hit a new personal...",
        time: '52 minutes ago',
        iconPath: 'assets/notification/notif-2.png',
      ),
      _NotificationItem(
        title: "You've completed 60% of your step go...",
        time: 'About 3 hours ago',
        iconPath: 'assets/notification/notif-2.png',
      ),
      _NotificationItem(
        title: 'Time for your workout',
        time: 'About 7 hours ago',
        iconPath: 'assets/notification/notif-3.png',
      ),
      _NotificationItem(
        title: 'Drink water before your next session.',
        time: 'About 17 hours ago',
        iconPath: 'assets/notification/notif-4.png',
      ),
      _NotificationItem(
        title: 'New workout available: HIIT Fat Burn...',
        time: 'Yesterday',
        iconPath: 'assets/notification/notif-3.png',
      ),
      _NotificationItem(
        title: 'Take a short walk or stretch.',
        time: '19 December',
        iconPath: 'assets/notification/notif-5.png',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9E4E4),
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: notifications.length,
            separatorBuilder: (_, __) => const Divider(
              height: 1,
              thickness: 1,
              color: Color(0xFFEDEDED),
            ),
            itemBuilder: (context, index) {
              return _NotificationTile(item: notifications[index]);
            },
          ),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({required this.item});

  final _NotificationItem item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 42,
              height: 42,
              child: Image.asset(item.iconPath, fit: BoxFit.contain),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.time,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9E9E9E),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 20,
                color: Color(0xFF9E9E9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationItem {
  final String title;
  final String time;
  final String iconPath;

  const _NotificationItem({
    required this.title,
    required this.time,
    required this.iconPath,
  });
}

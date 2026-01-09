import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late final List<_NotificationItem> _notifications;

  @override
  void initState() {
    super.initState();

    // Static demo data
    _notifications = <_NotificationItem>[
      const _NotificationItem(
        title: 'Join the 7-Day Fitness Challenge star...',
        description:
            'Start the 7-day fitness challenge today and stay consistent to build healthy habits, '
            'improve endurance, and unlock exclusive rewards at the end of the challenge. '
            'Complete daily tasks, track your progress, and share your journey with friends.',
        time: '28 minutes ago',
        iconPath: 'assets/notification/notif-1.png',
      ),
      const _NotificationItem(
        title: "Congrats! You've hit a new personal...",
        description:
            'Amazing work! You have officially reached a new personal best. Your dedication and '
            'consistency are paying off. Keep pushing with small improvements every day, and '
            'you’ll reach even bigger milestones sooner than you think.',
        time: '52 minutes ago',
        iconPath: 'assets/notification/notif-2.png',
      ),
      const _NotificationItem(
        title: "You've completed 60% of your step go...",
        description:
            'You are more than halfway to completing today’s step goal. A short walk, a quick '
            'stretch break, or taking the stairs can help you finish strong. Stay active and '
            'maintain your streak for better long-term results.',
        time: 'About 3 hours ago',
        iconPath: 'assets/notification/notif-2.png',
      ),
      const _NotificationItem(
        title: 'Time for your workout',
        description:
            'Your scheduled workout is due. Start with a warm-up, focus on good form, and take '
            'short rests when needed. Consistency matters more than perfection—show up and do your best.',
        time: 'About 7 hours ago',
        iconPath: 'assets/notification/notif-3.png',
      ),
      const _NotificationItem(
        title: 'Drink water before your next session.',
        description:
            'Hydration supports performance and recovery. Drink a glass of water now and keep a bottle '
            'nearby during your workout. A small habit like this can make a big difference over time.',
        time: 'About 17 hours ago',
        iconPath: 'assets/notification/notif-4.png',
      ),
      const _NotificationItem(
        title: 'New workout available: HIIT Fat Burn...',
        description:
            'A new HIIT session is available to help boost endurance and burn calories efficiently. '
            'This workout includes timed intervals with rest periods. Give it a try and adjust intensity '
            'based on your comfort level.',
        time: 'Yesterday',
        iconPath: 'assets/notification/notif-3.png',
      ),
      const _NotificationItem(
        title: 'Take a short walk or stretch.',
        description:
            'A quick movement break can improve circulation, reduce stiffness, and refresh your focus. '
            'Try a short walk, shoulder rolls, neck stretches, or gentle leg stretches for a few minutes.',
        time: '19 December',
        iconPath: 'assets/notification/notif-5.png',
      ),
    ];
  }

  void _showNotificationDialog(_NotificationItem item) {
    showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text(item.title),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.description, style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 16),
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
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _deleteAt(int index) {
    setState(() => _notifications.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: _notifications.isEmpty
              ? const Center(
                  child: Text(
                    'No notifications',
                    style: TextStyle(color: Color(0xFF9E9E9E)),
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: _notifications.length,
                  separatorBuilder: (_, __) => const Divider(
                    height: 1,
                    thickness: 1,
                    color: Color(0xFFEDEDED),
                  ),
                  itemBuilder: (context, index) {
                    final item = _notifications[index];
                    return _NotificationTile(
                      item: item,
                      onTap: () => _showNotificationDialog(item),
                      onDelete: () => _deleteAt(index),
                    );
                  },
                ),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({
    required this.item,
    required this.onTap,
    required this.onDelete,
  });

  final _NotificationItem item;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
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
            PopupMenuButton<_NotifAction>(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(maxWidth: 70),
              icon: const Icon(
                Icons.more_vert,
                size: 20,
                color: Color(0xFF9E9E9E),
              ),
              onSelected: (value) {
                if (value == _NotifAction.delete) onDelete();
              },
              itemBuilder: (_) => const [
                PopupMenuItem<_NotifAction>(
                  height: 20,
                  value: _NotifAction.delete,
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

enum _NotifAction { delete }

class _NotificationItem {
  final String title;
  final String description;
  final String time;
  final String iconPath;

  const _NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    required this.iconPath,
  });
}

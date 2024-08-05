import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  final List<NotificationItem> notifications = const [
    NotificationItem(
      title: 'New Message',
      details: 'You have received a new message from John.',
      icon: Icons.message,
    ),
    NotificationItem(
      title: 'Update Available',
      details: 'A new update is available for your app.',
      icon: Icons.system_update,
    ),
    NotificationItem(
      title: 'Reminder',
      details: 'Don\'t forget your meeting at 3 PM today.',
      icon: Icons.notifications,
    ),
    NotificationItem(
      title: 'Friend Request',
      details: 'Alice has sent you a friend request.',
      icon: Icons.person_add,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: ListView.separated(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: CircleAvatar(
              child: Icon(notification.icon),
            ),
            title: Text(notification.title),
            subtitle: Text(notification.details),
            onTap: () {
              // Handle notification tap
            },
          );
        }, separatorBuilder: (BuildContext context, int index) =>Divider(),
      ),
    );
  }
}



class NotificationItem {
  final String title;
  final String details;
  final IconData icon;

  const NotificationItem({
    required this.title,
    required this.details,
    required this.icon,
  });
}
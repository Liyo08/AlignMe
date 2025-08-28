import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5f5f5),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notification",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(
            icon: Icons.fastfood,
            iconColor: Colors.orange,
            title: "Hey, it’s time for lunch",
            subtitle: "About 1 minute ago",
          ),
          NotificationTile(
            icon: Icons.fitness_center,
            iconColor: Colors.purple,
            title: "Don’t miss your lowerbody workout",
            subtitle: "About 3 hours ago",
          ),
          NotificationTile(
            icon: Icons.fastfood,
            iconColor: Colors.orange,
            title: "Hey, let’s add some meals for your b..",
            subtitle: "About 3 hours ago",
          ),
          NotificationTile(
            icon: Icons.emoji_events,
            iconColor: Colors.blue,
            title: "Congratulations, You have finished A..",
            subtitle: "29 May",
          ),
          NotificationTile(
            icon: Icons.fastfood,
            iconColor: Colors.grey,
            title: "Hey, it’s time for lunch",
            subtitle: "8 April",
          ),
          NotificationTile(
            icon: Icons.fitness_center,
            iconColor: Colors.pink,
            title: "Ups, You have missed your Lowerbo..",
            subtitle: "3 April",
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: iconColor.withOpacity(0.2),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Colors.grey),
        ],
      ),
    );
  }
}

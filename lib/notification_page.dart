import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    appBar: AppBar(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  elevation: 0,
  centerTitle: true,
  leading: IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () => Navigator.pop(context),
  ),
  title: const Text(
    "Notifications",
    style: TextStyle(
      fontWeight: FontWeight.w900,
    ),
  ),
  actions: [
    IconButton(
      icon: const Icon(Icons.delete, color: Colors.red), // delete icon
      onPressed: () {
        // Clear notifications logic here
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("All notifications cleared")),
        );
      },
    ),
  ],
),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(
            icon: Icons.fastfood,
            iconColor: Colors.orange,
            title: "🍲 Lunch Reminder",
            details: "It’s 1:00 PM, don’t skip your meal! "
                "\n\n💡 Tip: Eat a balanced meal with protein, carbs, and veggies.",
            timeAgo: "2 hours ago",
          ),
          NotificationTile(
            icon: Icons.fitness_center,
            iconColor: Colors.purple,
            title: "💪 Workout Scheduled",
            details: "Your lower body session starts in 30 minutes."
                "\n\n💡 Tip: Warm up with stretches to avoid injury.",
            timeAgo: "3 hours ago",
          ),
          NotificationTile(
            icon: Icons.emoji_events,
            iconColor: Colors.blue,
            title: "🏆 Achievement Unlocked",
            details: "Congrats! You completed 7 workouts this week 🎉"
                "\n\n💡 Tip: Consistency is the key to progress.",
            timeAgo: "Yesterday",
          ),
          NotificationTile(
            icon: Icons.local_offer,
            iconColor: Colors.green,
            title: "🎁 Special Offer",
            details: "Get 20% off on your subscription renewal."
                "\n\n💡 Tip: Renew now to keep your streak going!",
            timeAgo: "1 day ago",
          ),
          NotificationTile(
            icon: Icons.fastfood,
            iconColor: Colors.red,
            title: "🍏 Add Meals to Your Log",
            details: "Don’t forget to track today’s dinner for accuracy."
                "\n\n💡 Tip: Tracking meals helps control calorie intake.",
            timeAgo: "3 days ago",
          ),
          NotificationTile(
            icon: Icons.fitness_center,
            iconColor: Colors.pink,
            title: "⚠️ Missed Workout",
            details: "You skipped your Upper Body routine last session."
                "\n\n💡 Tip: Try to reschedule missed workouts within 2 days.",
            timeAgo: "5 days ago",
          ),
          NotificationTile(
            icon: Icons.access_time,
            iconColor: Colors.teal,
            title: "⏰ Weekly Progress Report",
            details: "Check how many calories you burned this week."
                "\n\n💡 Tip: Review progress weekly to stay motivated.",
            timeAgo: "1 week ago",
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
  final String details;
  final String timeAgo;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.details,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to detail page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotificationDetailPage(
              title: title,
              icon: icon,
              iconColor: iconColor,
              details: details,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
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
                    timeAgo,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

class NotificationDetailPage extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String details;

  const NotificationDetailPage({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(),
        title: Text(
          title,
          style: const TextStyle( fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(icon, color: iconColor, size: 35),
            ),
            const SizedBox(height: 20),
            Text(
              details,
              style: const TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}

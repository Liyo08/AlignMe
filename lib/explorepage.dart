import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'main.dart'; // global flutterLocalNotificationsPlugin

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Explore Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Immediate Notification
            ElevatedButton(
              onPressed: () async {
                debugPrint("Immediate Notification button pressed");

                await flutterLocalNotificationsPlugin.show(
                  0,
                  'Immediate Notification',
                  'This notification appears immediately!',
                  const NotificationDetails(
                    android: AndroidNotificationDetails(
                      'explore_channel',
                      'Explore Notifications',
                      channelDescription: 'Notifications for Explore page',
                      importance: Importance.max,
                      priority: Priority.high,
                    ),
                  ),
                );

                debugPrint("✅ Immediate notification fired!");
              },
              child: const Text("Show Immediate Notification"),
            ),

            const SizedBox(height: 20),

            // Delayed Notification (10s)
            ElevatedButton(
              onPressed: () {
                debugPrint("Delayed Notification button pressed");

                Future.delayed(const Duration(seconds: 10), () async {
                  await flutterLocalNotificationsPlugin.show(
                    1,
                    'Delayed Notification',
                    'This notification appears after 10 seconds!',
                    const NotificationDetails(
                      android: AndroidNotificationDetails(
                        'explore_channel',
                        'Explore Notifications',
                        channelDescription: 'Notifications for Explore page',
                        importance: Importance.max,
                        priority: Priority.high,
                      ),
                    ),
                  );

                  debugPrint("⏱ Delayed notification fired after 10 seconds");
                });
              },
              child: const Text("Show Notification after 10s"),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TodayTargetPage extends StatelessWidget {
  const TodayTargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Today's Target",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF92A3FD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Your Health Targets for Today",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 20),

            // Step Count Target
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.directions_walk, color: Colors.blue),
                title: const Text("Steps"),
                subtitle: const Text("Goal: 8000 steps"),
                trailing: const Text("5200"),
              ),
            ),

            // Water Intake Target
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.water_drop, color: Colors.cyan),
                title: const Text("Water"),
                subtitle: const Text("Goal: 3 Liters"),
                trailing: const Text("2.1 L"),
              ),
            ),

            // Calories Burn
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.local_fire_department,
                    color: Colors.redAccent),
                title: const Text("Calories Burned"),
                subtitle: const Text("Goal: 500 kcal"),
                trailing: const Text("350 kcal"),
              ),
            ),

            // Sleep Target
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: const Icon(Icons.bedtime, color: Colors.purple),
                title: const Text("Sleep"),
                subtitle: const Text("Goal: 8 hours"),
                trailing: const Text("6.5 h"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

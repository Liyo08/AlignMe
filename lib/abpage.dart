import 'package:flutter/material.dart';

class AbWorkout extends StatelessWidget {
  const AbWorkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Abs Workout"),
        backgroundColor: const Color(0xFF92A3FD),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Today's Abs Workout",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          // Example workout cards
          _workoutCard("Crunches", "3 sets • 15 reps", "🔥 Strengthens core"),
          _workoutCard("Leg Raises", "3 sets • 12 reps", "💪 Lower abs focus"),
          _workoutCard("Plank", "3 sets • 40 sec hold", "⚡ Improves stability"),
          _workoutCard("Russian Twist", "3 sets • 20 reps", "🏋️ Builds obliques"),
        ],
      ),
    );
  }

  // Reusable workout card widget
  Widget _workoutCard(String title, String sets, String desc) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(15),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text("$sets\n$desc"),
        trailing: const Icon(Icons.fitness_center, color: Color(0xFF92A3FD)),
      ),
    );
  }
}

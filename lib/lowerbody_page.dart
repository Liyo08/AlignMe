import 'package:flutter/material.dart';

class LowerBody extends StatelessWidget {
  const LowerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lower Body Workout"),
        backgroundColor: const Color(0xFF92A3FD),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "Today's Lower Body Workout",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),

          // Example workout cards
          _workoutCard("Squats", "4 sets • 12 reps", "🔥 Builds thighs & glutes"),
          _workoutCard("Lunges", "3 sets • 10 reps each leg", "💪 Improves balance"),
          _workoutCard("Calf Raises", "4 sets • 15 reps", "🦵 Strengthens calves"),
          _workoutCard("Glute Bridges", "3 sets • 12 reps", "🍑 Activates glutes"),
        ],
      ),
    );
  }

  // Widget for reusable workout cards
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

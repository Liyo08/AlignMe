import 'package:flutter/material.dart';

class WorkoutPage extends StatelessWidget {
  const WorkoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest Workouts"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          WorkoutCard(title: "Morning Yoga", duration: "30 min"),
          WorkoutCard(title: "Cardio Blast", duration: "45 min"),
          WorkoutCard(title: "Strength Training", duration: "1 hr"),
          WorkoutCard(title: "Evening Stretch", duration: "20 min"),
        ],
      ),
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String duration;

  const WorkoutCard({super.key, required this.title, required this.duration});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: const Icon(Icons.fitness_center, color: Colors.blueAccent),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Duration: $duration"),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // You can navigate to workout details here later
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Opening $title workout...")),
          );
        },
      ),
    );
  }
}

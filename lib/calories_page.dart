import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class CaloriesPage extends StatelessWidget {
  const CaloriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calories"),
        backgroundColor: const Color(0xFF92A3FD),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Calories Summary",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Pie chart
            SizedBox(
              height: 200,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 50,
                  sections: [
                    PieChartSectionData(
                      value: 760,
                      title: "760",
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      radius: 40,
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFC58BF2),
                          Color(0xFFB4C0FE),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    PieChartSectionData(
                      value: 230,
                      title: "230",
                      titleStyle: const TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                      color: Colors.grey.shade200,
                      radius: 40,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatCard(label: "Goal", value: "1000 kcal"),
                _StatCard(label: "Consumed", value: "760 kcal"),
                _StatCard(label: "Left", value: "230 kcal"),
              ],
            ),
            const SizedBox(height: 30),

            // Suggestion text
            const Text(
              "Great job! You're on track with your calorie goal today 🎉",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable stat card widget
class _StatCard extends StatelessWidget {
  final String label;
  final String value;

  const _StatCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        children: [
          Text(label,
              style: const TextStyle(
                  fontSize: 12, color: Colors.black54)),
          const SizedBox(height: 4),
          Text(value,
              style: const TextStyle(
                  fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

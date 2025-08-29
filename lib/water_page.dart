import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class WaterDetailsPage extends StatefulWidget {
  const WaterDetailsPage({super.key});

  @override
  State<WaterDetailsPage> createState() => _WaterDetailsPageState();
}

class _WaterDetailsPageState extends State<WaterDetailsPage> {
  String selectedRange = "Weekly"; // toggle between weekly & monthly
  double currentWater = 2.5; // in Liters
  double goalWater = 4.0; // daily goal

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Water Intake"),
        backgroundColor: const Color(0xFF92A3FD),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Bottle UI
            Expanded(
              child: Center(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    // Bottle outline
                    Container(
                      width: 120,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 163, 162, 162),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    // Water level
                    Container(
                      width: 118,
                      height: (currentWater / goalWater) * 298, // proportional
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xFFC58BF2), Color(0xFFB4C0FE)],
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(38),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      child: Text(
                        "${currentWater.toStringAsFixed(1)} L / ${goalWater.toStringAsFixed(1)} L",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Toggle Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text("Weekly"),
                  selected: selectedRange == "Weekly",
                  onSelected: (val) {
                    setState(() => selectedRange = "Weekly");
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Monthly"),
                  selected: selectedRange == "Monthly",
                  onSelected: (val) {
                    setState(() => selectedRange = "Monthly");
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Bar Chart
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  barGroups: _generateBarGroups(),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 28),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          if (selectedRange == "Weekly") {
                            const days = ["M", "T", "W", "T", "F", "S", "S"];
                            return Text(days[value.toInt() % days.length]);
                          } else {
                            return Text("${value.toInt() + 1}");
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Generate bar chart groups
  List<BarChartGroupData> _generateBarGroups() {
    if (selectedRange == "Weekly") {
      final weeklyData = [2.5, 3.0, 2.8, 3.5, 2.9, 3.2, 3.8]; // sample
      return List.generate(
        weeklyData.length,
        (i) => BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: weeklyData[i],
              gradient: const LinearGradient(
                colors: [Color(0xFFC58BF2), Color(0xFFB4C0FE)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              width: 18,
              borderRadius: BorderRadius.circular(6),
            ),
          ],
        ),
      );
    } else {
      final monthlyData = [3.0, 2.8, 3.5, 3.2, 3.6, 3.1, 2.9, 3.7, 3.4, 3.0, 3.8, 2.7];
      return List.generate(
        monthlyData.length,
        (i) => BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: monthlyData[i],
              gradient: const LinearGradient(
                colors: [Color(0xFFC58BF2), Color(0xFFB4C0FE)],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              width: 10,
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ),
      );
    }
  }
}

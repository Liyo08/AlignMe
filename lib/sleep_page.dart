import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SleepPage extends StatefulWidget {
  const SleepPage({super.key});

  @override
  State<SleepPage> createState() => _SleepPageState();
}

class _SleepPageState extends State<SleepPage> {
  bool isWeekly = true;

  // Dummy data for weekly (hours of sleep each day)
  final List<double> weeklySleep = [7.5, 8.0, 6.5, 7.0, 8.2, 7.8, 6.9];

  // Dummy data for monthly (average per week)
  final List<double> monthlySleep = [7.2, 7.8, 6.9, 7.5];

  String getVerdict(double avg) {
    if (avg >= 7.5) return "Excellent Sleep 😴";
    if (avg >= 6.5) return "Good, but can improve 🙂";
    return "Poor Sleep 😟";
  }

  @override
  Widget build(BuildContext context) {
    final data = isWeekly ? weeklySleep : monthlySleep;
    final avg = data.reduce((a, b) => a + b) / data.length;

    return Scaffold(
      appBar: AppBar(title: const Text("Sleep Statistics"), centerTitle: true, backgroundColor: Theme.of(context).scaffoldBackgroundColor,),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceChip(
                  label: const Text("Weekly"),
                  selected: isWeekly,
                  onSelected: (val) {
                    setState(() => isWeekly = true);
                  },
                ),
                const SizedBox(width: 12),
                ChoiceChip(
                  label: const Text("Monthly"),
                  selected: !isWeekly,
                  onSelected: (val) {
                    setState(() => isWeekly = false);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              isWeekly ? "This Week's Sleep" : "Monthly Average Sleep",
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Chart
            SizedBox(
              height: isWeekly ? 300 : 250,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 10, // Max 10 hours sleep
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                        interval: 2,
                        getTitlesWidget: (value, meta) {
                          return Text("${value.toInt()}h"); // Y-axis hours
                        },
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          if (isWeekly) {
                            const days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
                            if (value.toInt() < days.length) {
                              return Text(days[value.toInt()]);
                            }
                          } else {
                            const weeks = ["W1", "W2", "W3", "W4"];
                            if (value.toInt() < weeks.length) {
                              return Text(weeks[value.toInt()]);
                            }
                          }
                          return const Text("");
                        },
                      ),
                    ),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  barGroups: data
                      .asMap()
                      .entries
                      .map(
                        (e) => BarChartGroupData(
                          x: e.key,
                          barRods: [
                            BarChartRodData(
                              toY: e.value, // sleep hours
                              color: Colors.purple,
                              width: 18,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Summary + Verdict
            Center(
              child: Column(
                children: [
                  Text(
                    isWeekly
                        ? "Weekly Avg: ${avg.toStringAsFixed(1)} h"
                        : "Monthly Avg: ${avg.toStringAsFixed(1)} h",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    getVerdict(avg),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

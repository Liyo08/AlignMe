import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(surface: Colors.white, onSurface: Colors.black),
      ),
      home: const WaterTrackerPage(),
    );
  }
}

class WaterTrackerPage extends StatefulWidget {
  const WaterTrackerPage({super.key});

  @override
  State<WaterTrackerPage> createState() => _WaterTrackerPageState();
}

class _WaterTrackerPageState extends State<WaterTrackerPage>
    with SingleTickerProviderStateMixin {
  double currentWater = 900; // in ml
  double goalWater = 2000; // in ml

  String selectedRange = "Weekly";

  late AnimationController _congratsController;
  bool showCongrats = false;

  @override
  void initState() {
    super.initState();
    _congratsController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
  }

  void updateWater(int delta) {
    setState(() {
      currentWater += delta;
      if (currentWater < 0) currentWater = 0;

      if (currentWater >= goalWater && !showCongrats) {
        showCongrats = true;
        _congratsController.forward(from: 0);
      }
    });
  }

  void editGoal() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController controller =
            TextEditingController(text: goalWater.toString());
        return AlertDialog(
          title: const Text('Edit Daily Goal (ml)'),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(hintText: 'Enter goal in ml'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  goalWater = double.tryParse(controller.text) ?? goalWater;
                  showCongrats = currentWater >= goalWater;
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _congratsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Water Tracker'),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Track Water'),
              Tab(text: 'History'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Stack(
              children: [
                // Gradient background filling effect
                Positioned(
                  bottom: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *
                        (currentWater / goalWater).clamp(0.0, 1.0),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFC58BF2), Color(0xFFB4C0FE)],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                ),

                // Main content
                Column(
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      '${currentWater.toStringAsFixed(1)} ml',
                      style: const TextStyle(
                          fontSize: 48, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Daily goal: ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '$goalWater ml',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: editGoal,
                        )
                      ],
                    ),
                    const SizedBox(height: 30),
                    if (showCongrats)
                      ScaleTransition(
                        scale: _congratsController
                            .drive(CurveTween(curve: Curves.elasticOut)),
                        child: const Icon(Icons.celebration,
                            color: Colors.amber, size: 100),
                      ),
                    const SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FloatingActionButton(
                          onPressed: () => updateWater(-300),
                          child: const Icon(Icons.remove, size: 36),
                          heroTag: 'remove',
                        ),
                        const SizedBox(width: 40),
                        FloatingActionButton(
                          onPressed: () => updateWater(300),
                          child: const Icon(Icons.add, size: 36),
                          heroTag: 'add',
                        ),
                        const SizedBox(width: 40),
                        FloatingActionButton(
                          onPressed: editGoal,
                          child: const Icon(Icons.local_drink, size: 28),
                          heroTag: 'edit',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            WaterDetailsPage(selectedRange: selectedRange),
          ],
        ),
      ),
    );
  }
}

class WaterDetailsPage extends StatefulWidget {
  final String selectedRange;

  const WaterDetailsPage({super.key, required this.selectedRange});

  @override
  State<WaterDetailsPage> createState() => _WaterDetailsPageState();
}

class _WaterDetailsPageState extends State<WaterDetailsPage> {
  String selectedRange = "Weekly";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Material(
            child: Row(
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
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: _generateBarGroups(),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles:
                        SideTitles(showTitles: true, reservedSize: 28),
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
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    if (selectedRange == "Weekly") {
      final weeklyData = [900, 1200, 800, 1500, 1100, 1300, 1600];
      return List.generate(
        weeklyData.length,
        (i) => BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: weeklyData[i].toDouble(),
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
      final monthlyData = [
        1000, 1500, 1300, 1400, 1200, 1600, 1700, 1300, 1500, 1100, 1800, 1200
      ];
      return List.generate(
        monthlyData.length,
        (i) => BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: monthlyData[i].toDouble(),
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

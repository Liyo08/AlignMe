import 'dart:math';
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
        scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
    with TickerProviderStateMixin {
  double currentWater = 0;
  double goalWater = 2000;
  double animatedWater = 0;

  late AnimationController _waterController;
  late Animation<double> _waterAnimation;

  late AnimationController _congratsController;
  bool showCongrats = false;

  String selectedRange = "Weekly";

  @override
  void initState() {
    super.initState();

    _congratsController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));

    _waterController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    animatedWater = currentWater;
  }

  void updateWater(int delta) {
    double newWater = currentWater + delta;
    if (newWater < 0) newWater = 0;

    if (newWater >= goalWater && !showCongrats) {
      showCongrats = true;
      _congratsController.forward(from: 0);
    }

    // Animate water smoothly
    _waterAnimation = Tween<double>(begin: animatedWater, end: newWater).animate(
      CurvedAnimation(parent: _waterController, curve: Curves.easeOut),
    )..addListener(() {
        setState(() {
          animatedWater = _waterAnimation.value;
        });
      });

    _waterController.forward(from: 0);

    currentWater = newWater;
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
            decoration: const InputDecoration(hintText: 'Enter goal in ml'),
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
    _waterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back_ios_new),
    onPressed: () {
      Navigator.pop(context); // go back to previous screen
    },
  ),
  title: const Text(
    'Water Tracker',
    style: TextStyle(),
  ),
  centerTitle: true,
  // optional: match scaffold background
  elevation: 0,
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
                // Wavy water
                Positioned(
                  bottom: 0,
                  child: WavyWater(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fillPercent: (animatedWater / goalWater).clamp(0.0, 1.0),
                  ),
                ),

                // Main content
                Column(
  children: [
    const SizedBox(height: 40),
    Text(
      '${currentWater.toStringAsFixed(0)} ml',
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

    Spacer(), // Push buttons to bottom

   Padding(
  padding: const EdgeInsets.only(bottom: 30),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // Remove button
      GestureDetector(
        onTap: () => updateWater(-100),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.remove, size: 24, color: Colors.white),
        ),
      ),
      const SizedBox(width: 40),

      // Add button (larger)
      GestureDetector(
        onTap: () => updateWater(100),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.add, size: 40, color: Colors.white),
        ),
      ),
      const SizedBox(width: 40),

      // Edit goal button
      GestureDetector(
        onTap: editGoal,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.local_drink, size: 24, color: Colors.white),
        ),
      ),
    ],
  ),
),

  ],
)

              ],
            ),
            WaterDetailsPage(selectedRange: selectedRange),
          ],
        ),
      ),
    );
  }
}

// -------------------- Wavy Water Widget --------------------
class WavyWater extends StatefulWidget {
  final double fillPercent;
  final double width;
  final double height;

  const WavyWater({
    super.key,
    required this.fillPercent,
    required this.width,
    required this.height,
  });

  @override
  State<WavyWater> createState() => _WavyWaterState();
}

class _WavyWaterState extends State<WavyWater>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ClipPath(
          clipper: WaveClipper(_controller.value),
          child: Container(
            width: widget.width,
            height: widget.height * widget.fillPercent,
            decoration: BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Color(0xFF6CCFF6).withOpacity(0.7),
      Color(0xFF0077FF).withOpacity(0.9)
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    stops: [0.0, 1.0],
  ),
),
          ),
        );
      },
    );
  }
}

// -------------------- Wave clipper --------------------
class WaveClipper extends CustomClipper<Path> {
  final double animationValue;
  WaveClipper(this.animationValue);

  @override
  Path getClip(Size size) {
    final path = Path();
    final waveHeight = 20.0;
    final waveLength = size.width;

    path.moveTo(0, size.height);
    for (double x = 0; x <= size.width; x++) {
      double y = waveHeight *
              sin((x / waveLength * 2 * pi) + (animationValue * 2 * pi)) +
          size.height * 0.05; // slight offset
      path.lineTo(x, y);
    }
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant WaveClipper oldClipper) => true;
}

// -------------------- Water Details Page --------------------
class WaterDetailsPage extends StatefulWidget {
  final String selectedRange;

  const WaterDetailsPage({super.key, required this.selectedRange});

  @override
  State<WaterDetailsPage> createState() => _WaterDetailsPageState();
}

class _WaterDetailsPageState extends State<WaterDetailsPage> {
  late String selectedRange;

  @override
  void initState() {
    super.initState();
    selectedRange = widget.selectedRange;
  }

  @override
  Widget build(BuildContext context) {
    final barGroups = _generateBarGroups();
    final maxY =
        (barGroups.map((e) => e.barRods[0].toY).reduce((a, b) => a > b ? a : b) * 1.2);

    return Padding(
      padding: const EdgeInsets.all(10),
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
                maxY: maxY,
                barGroups: barGroups,
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  leftTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 28)),
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
              width: 12,
              borderRadius: BorderRadius.circular(6),
            ),
          ],
        ),
      );
    }
  }
}

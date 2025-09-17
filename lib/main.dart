import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'camera_page.dart';
import 'stats_page.dart';
import 'Profile_page.dart';
import 'notification_page.dart';
import 'poseperfect_page.dart';
import 'flowease_page.dart';
import 'alignmart_page.dart';
import 'bmi_page.dart';
import 'todaytarget_page.dart';
import 'workout_page.dart';
import 'sleep_page.dart';
import 'calories_page.dart';
import 'water_page.dart';
import 'heart_page.dart';
import 'splash_page.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';
import 'dart:math';
import 'explorepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppTheme(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppTheme>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.grey[100],
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
            .copyWith(surface: Colors.white, onSurface: Colors.black),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Poppins',
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        cardColor: const Color(0xFF1E1E1E),
        colorScheme: ColorScheme.fromSwatch(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
        ).copyWith(surface: Colors.black, onSurface: Colors.white),
      ),
      themeMode: themeProvider.themeMode,
      home: const SplashPage1(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
            bottom: 95.0, // adjust as per your navbar height
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 30), // space for status bar

            // 🔔 Notification Icon (clickable + navigates to another page)
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 25), // 👈 move down + right
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationsPage()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.notifications_none,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ✅ Rest of your content
            const Text(
              "Welcome Back,",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Text(
              "Jeel!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            // BMI Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: getBMIGradient(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("BMI (Body Mass Index)",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        const SizedBox(height: 4),
                        const Text("You have a normal weight",
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                        const SizedBox(height: 10),
                        // Your button
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    BMIScreen(), // navigate to BMI page
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(1.00, 1.00),
                                end: Alignment(-0.24, -0.31),
                                colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 4),
                              child: Text(
                                "View More",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  // Circular progress
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          backgroundColor: Colors.white30,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFFC58BF2),
                          ),
                        ),
                      ),
                      const Text(
                        "20.1",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Today Target Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                gradient: getTargetGradient(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today Target",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TodayTargetPage(), // Replace with your page
                        ),
                      );
                    },
                    child: Container(
                      width: 80,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment(1.00, 1.00),
                          end: Alignment(-0.24, -0.31),
                          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      child: const Text(
                        "Check",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Feature Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _featureCard(
                  "PosePerfect",
                  "Align. Improve. Repeat.",
                  'assets/1.png',
                  context,
                  const PosePerfectPage(),
                ),
                const SizedBox(width: 12),
                _featureCard(
                  "FlowEase",
                  "Breathe. Stretch. Heal.",
                  'assets/2.png',
                  context,
                  const FlowEasePage(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _featureCar(
              "AlignMart",
              "Essentials for your Yoga \njourney.",
              'assets/3.png',
              context,
              const AlignMartPage(),
            ),

            // ---------------- Activity Status ----------------
            const SizedBox(height: 30),
            const Text("Activity Status",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Heart Rate card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeartRatePage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: Theme.of(context).brightness == Brightness.dark
                      ? const LinearGradient(
                          begin: Alignment(1.00, 1.00),
                          end: Alignment(-0.24, -0.31),
                          colors: [
                            Color(0xFF3E3C8F), // deep indigo
                            Color(0xFF6C63FF), // vibrant violet
                          ],
                        )
                      : const LinearGradient(
                          begin: Alignment(1.00, 1.00),
                          end: Alignment(-0.24, -0.31),
                          colors: [
                            Color.fromARGB(255, 229, 232, 250),
                            Color.fromARGB(255, 226, 236, 247),
                          ],
                        ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Heart Rate",
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      height: 120,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          titlesData: FlTitlesData(show: false),
                          borderData: FlBorderData(show: false),
                          lineBarsData: [
                            LineChartBarData(
                              spots: const [
                                FlSpot(0, 70),
                                FlSpot(1, 75),
                                FlSpot(2, 78),
                                FlSpot(3, 76),
                                FlSpot(4, 80),
                                FlSpot(5, 78),
                              ],
                              isCurved: true,
                              color: Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? const Color(
                                      0xFF9DCEFF) // bright cyan-blue in dark
                                  : const Color(0xFF92A3FD),
                              barWidth: 3,
                              belowBarData: BarAreaData(
                                show: true,
                                gradient: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? LinearGradient(
                                        colors: [
                                          const Color(0xFF6C63FF)
                                              .withOpacity(0.3),
                                          const Color(0xFF6C63FF)
                                              .withOpacity(0.0),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : LinearGradient(
                                        colors: [
                                          Colors.blueAccent.withOpacity(0.2),
                                          Colors.blueAccent.withOpacity(0.0),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "78 BPM",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? const Color(0xFF9DCEFF)
                            : const Color(0xFF92A3FD),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 4),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment(1.00, 1.00),
                            end: Alignment(-0.24, -0.31),
                            colors: [
                              Color(0xFFC58BF2),
                              Color(0xFFEEA4CE),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "3 mins ago",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
// Grid with Water, Sleep, Calories
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ---------------- Water Intake ----------------
                Expanded(
                  child: InkWell(
                    borderRadius:
                        BorderRadius.circular(20), // ripple effect matches card
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WaterTrackerPage()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        // card color from theme
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6),
                        ],
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left: Water Level Bar
                          Container(
                            height: 355,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                height: 140, // adjust based on water consumed
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xFFC58BF2),
                                      Color(0xFFB4C0FE),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),

                          // Right: Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Water Intake",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(height: 4),
                                const Text("4 Liters",
                                    style: TextStyle(
                                        color: Color(0xFF92A3FD),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 12),
                                const Text("Real time updates",
                                    style: TextStyle(fontSize: 12)),
                                const SizedBox(height: 12),

                                // Timeline entries
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    _TimelineRow(
                                        time: "6am - 8am", amount: "600ml"),
                                    _TimelineRow(
                                        time: "9am - 11am", amount: "500ml"),
                                    _TimelineRow(
                                        time: "11am - 2pm", amount: "1000ml"),
                                    _TimelineRow(
                                        time: "2pm - 4pm", amount: "700ml"),
                                    _TimelineRow(
                                        time: "4pm - now",
                                        amount: "900ml",
                                        isActive: true),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // ---------------- Right column with Sleep & Calories ----------------
                Expanded(
                  child: Column(
                    children: [
                      // Sleep
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SleepPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            // card color from theme
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 6)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Sleep",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12)),
                              const SizedBox(height: 8),
                              const Text("8h 20m",
                                  style: TextStyle(
                                      color: Color(0xFF92A3FD),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 80,
                                child: LineChart(
                                  LineChartData(
                                    gridData: FlGridData(show: false),
                                    titlesData: FlTitlesData(show: false),
                                    borderData: FlBorderData(show: false),
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: const [
                                          FlSpot(0, 1),
                                          FlSpot(1, 1.5),
                                          FlSpot(2, 1.2),
                                          FlSpot(3, 1.8),
                                          FlSpot(4, 1.4),
                                        ],
                                        isCurved: true,
                                        gradient: const LinearGradient(
                                          colors: [
                                            Colors.purple,
                                            Colors.purple
                                          ],
                                        ),
                                        barWidth: 2,
                                      ),
                                      LineChartBarData(
                                        spots: const [
                                          FlSpot(0, 1.3),
                                          FlSpot(1, 1.7),
                                          FlSpot(2, 1.1),
                                          FlSpot(3, 1.6),
                                          FlSpot(4, 1.2),
                                        ],
                                        isCurved: true,
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.purple.shade200,
                                            Colors.purple.shade200
                                          ],
                                        ),
                                        barWidth: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Calories
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CaloriesPage()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            // card color from theme
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 6),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Calories",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              const Text("760 kcal",
                                  style: TextStyle(
                                      color: Color(0xFF92A3FD), fontSize: 16)),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 102.5,
                                child: PieChart(
                                  PieChartData(
                                    centerSpaceRadius: 35,
                                    sections: [
                                      PieChartSectionData(
                                        value: 760,
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFFC58BF2),
                                            Color(0xFFB4C0FE),
                                          ],
                                          stops: [-0.8311, 0.606],
                                        ),
                                        radius: 12,
                                      ),
                                      PieChartSectionData(
                                        value: 230,
                                        color: const Color.fromARGB(
                                            255, 218, 217, 217),
                                        radius: 12,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text(
                                  "230 kcal left",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

// ---------------- Latest Workout Section ----------------
            const SizedBox(height: 30),
            LatestWorkoutSection(),
          ]),
        ),
      ),
    );
  }

  Widget _featureCard(
    String title,
    String subtitle,
    String asset,
    BuildContext context,
    Widget page,
  ) {
    return Expanded(
      // <-- makes it responsive
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: NeonBorderCard(
          // <-- Wrap Container with NeonBorderCard
          neonColor: Color(0xFFC58BF2), // lavender shade
          borderRadius: 20,
          borderWidth: 3,
          child: Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // 👈 vertical center
              crossAxisAlignment:
                  CrossAxisAlignment.center, // 👈 horizontal center
              children: [
                Image.asset(asset, height: 80),
                const SizedBox(height: 10),
                Text(
                  title,
                  textAlign: TextAlign.center, // 👈 center text
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  textAlign: TextAlign.center, // 👈 center text
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _featureCar(
    String title,
    String subtitle,
    String asset,
    BuildContext context,
    Widget page,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      borderRadius: BorderRadius.circular(20),
      child: NeonBorderCard(
        // <-- Wrap the container here
        neonColor: Colors.lightBlueAccent,
        borderRadius: 20,
        borderWidth: 3,
        child: Container(
          width: 440,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // space between text & image
            crossAxisAlignment:
                CrossAxisAlignment.center, // align center vertically
            children: [
              // Left side: title + subtitle
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // left align text
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              // Right side: image
              Image.asset(
                asset,
                height: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------- Latest Workout Section ----------------
class LatestWorkoutSection extends StatelessWidget {
  const LatestWorkoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Latest Workout",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                // Navigate to another page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WorkoutPage()),
                );
              },
              child: Text(
                "See more",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Workout Cards
        WorkoutCard(
          title: "Fullbody Workout",
          subtitle: "180 Calories Burn | 20minutes",
          progress: 0.4,
          icon: Icons.fitness_center,
          iconBg: Colors.purple.shade100,
        ),
        WorkoutCard(
          title: "Lowerbody Workout",
          subtitle: "200 Calories Burn | 30minutes",
          progress: 0.6,
          icon: Icons.directions_run,
          iconBg: Colors.pink.shade100,
        ),
        WorkoutCard(
          title: "Ab Workout",
          subtitle: "180 Calories Burn | 20minutes",
          progress: 0.35,
          icon: Icons.accessibility_new,
          iconBg: Colors.blue.shade100,
        ),
      ],
    );
  }
}

class WorkoutCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final double progress;
  final IconData icon;
  final Color iconBg;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.icon,
    required this.iconBg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Circle
          Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
              color: iconBg,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30, color: Colors.black87),
          ),
          const SizedBox(width: 15),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 13),
                ),
                const SizedBox(height: 8),

                // Progress bar
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 6,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(181, 109, 109, 248),
                  ),
                ),
              ],
            ),
          ),

          // Right Circle
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromARGB(255, 210, 156, 239), width: 2),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------- Timeline Row Widget ----------------
class _TimelineRow extends StatelessWidget {
  final String time;
  final String amount;
  final bool isActive;

  const _TimelineRow({
    Key? key,
    required this.time,
    required this.amount,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: isActive ? Colors.purpleAccent : Colors.purple.shade200,
              shape: BoxShape.circle,
              boxShadow: isActive
                  ? [
                      BoxShadow(
                        color: Colors.purpleAccent.withOpacity(0.5),
                        blurRadius: 8,
                        spreadRadius: 2,
                      )
                    ]
                  : [],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(time, style: const TextStyle(fontSize: 12)),
              Text(amount,
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.purple.shade300,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
   
    const ExplorePage(),
     const StatsPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // ✅ keep transparent
      extendBody: true, // ✅ extend body behind navbar (for shadows/effects)
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor, // black bg
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), // ✅ curved top edges
            topRight: Radius.circular(50),
          ),
        ), // ✅ makes the area below navbar white
        child: SafeArea(
          top: false, // ✅ apply only bottom padding (not top)
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                height: 55,
                margin: const EdgeInsets.only(left: 8, right: 8, top: 2),
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _navItem(Icons.home, 0),
                    _navItem(Icons.explore, 2),
                    
                    const SizedBox(width: 70),
                    _navItem(Icons.track_changes, 1),
                    _navItem(Icons.person_outline, 3),
                  ],
                ),
              ),
              Positioned(
                bottom: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CameraPage()),
                    );
                  },
                  child: Container(
                    height: 65,
                    width: 75,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 1.00),
                        end: Alignment(-0.24, -0.31),
                        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                      ),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blueAccent.withOpacity(0.3),
                          blurRadius: 12,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.camera_alt_outlined,
                        color: Colors.white, size: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, int index) {
    final bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Icon(
        icon,
        color:
            isActive ? const Color.fromARGB(255, 227, 137, 245) : Colors.grey,
        size: 28,
      ),
    );
  }
}

LinearGradient getBMIGradient(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const LinearGradient(
          begin: Alignment(1.00, 1.00),
          end: Alignment(-0.24, -0.31),
          colors: [
            Color(0xFF4A4E91),
            Color(0xFF6C63FF)
          ], // deep indigo & violet
        )
      : const LinearGradient(
          begin: Alignment(1.00, 1.00),
          end: Alignment(-0.24, -0.31),
          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)], // pastel blue
        );
}

LinearGradient getTargetGradient(BuildContext context) {
  return Theme.of(context).brightness == Brightness.dark
      ? const LinearGradient(
          begin: Alignment(1.00, 1.00),
          end: Alignment(-0.24, -0.31),
          colors: [Color(0xFF3E3C8F), Color(0xFF2C3E70)], // muted purple/navy
        )
      : const LinearGradient(
          begin: Alignment(1.00, 1.00),
          end: Alignment(-0.24, -0.31),
          colors: [Color(0xFFC9D0F1), Color(0xFFDFEDFB)], // soft lavender/sky
        );
}

class NeonBorderCard extends StatefulWidget {
  final Widget child;
  final double borderWidth;
  final double borderRadius;
  final Color neonColor; // <-- new parameter for custom neon color

  const NeonBorderCard({
    super.key,
    required this.child,
    this.borderWidth = 3,
    this.borderRadius = 20,
    this.neonColor = Colors.lightBlueAccent, // default blue
  });

  @override
  State<NeonBorderCard> createState() => _NeonBorderCardState();
}

class _NeonBorderCardState extends State<NeonBorderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
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
      builder: (_, __) {
        return CustomPaint(
          painter: _NeonBorderPainter(
            animationValue: _controller.value,
            borderRadius: widget.borderRadius,
            borderWidth: widget.borderWidth,
            neonColor: widget.neonColor, // pass the color
          ),
          child: widget.child,
        );
      },
    );
  }
}

class _NeonBorderPainter extends CustomPainter {
  final double animationValue;
  final double borderRadius;
  final double borderWidth;
  final Color neonColor; // new color parameter

  _NeonBorderPainter({
    required this.animationValue,
    required this.borderRadius,
    required this.borderWidth,
    required this.neonColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(borderRadius));

    // SweepGradient for glowing neon effect
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth
      ..shader = SweepGradient(
        startAngle: 0,
        endAngle: 2 * pi,
        colors: [
          neonColor.withOpacity(0.0),
          neonColor.withOpacity(0.8),
          neonColor,
          neonColor.withOpacity(0.8),
          neonColor.withOpacity(0.0),
        ],
        stops: [0.0, 0.2, 0.5, 0.8, 1.0],
        transform: GradientRotation(2 * pi * animationValue),
      ).createShader(rect);

    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant _NeonBorderPainter oldDelegate) => true;
}

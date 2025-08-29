import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'fullbody_page.dart';
import 'lowerbody_page.dart';
import 'abpage.dart';

class PosePerfectPage extends StatelessWidget {
  const PosePerfectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔹 Gradient Header with Chart
              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF7F7FD5),
                      Color(0xFF86A8E7),
                      Color(0xFF91EAE4)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Stack(
  alignment: Alignment.center,
  children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        const Icon(Icons.more_horiz, color: Colors.white),
      ],
    ),
    const Text(
      "Pose Perfect",
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w900,
      ),
    ),
  ],
),
                    const SizedBox(height: 20),

                    // 📊 Chart
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          minY: 0,
                          maxY: 7,
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            rightTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            topTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false)),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 28,
                                interval: 1,
                                getTitlesWidget: (value, meta) {
                                  final days = [
                                    "Sun",
                                    "Mon",
                                    "Tue",
                                    "Wed",
                                    "Thu",
                                    "Fri",
                                    "Sat"
                                  ];
                                  if (value.toInt() >= 0 &&
                                      value.toInt() < days.length) {
                                    return Text(
                                      days[value.toInt()],
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              ),
                            ),
                          ),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              spots: const [
                                FlSpot(0, 3),
                                FlSpot(1, 4),
                                FlSpot(2, 1),
                                FlSpot(3, 5),
                                FlSpot(4, 2),
                                FlSpot(5, 6),
                                FlSpot(6, 4),
                              ],
                              color: Colors.white,
                              barWidth: 3,
                              isStrokeCapRound: true,
                              dotData: const FlDotData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // 🔹 White Content Section (fixed height issue ✅)
              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                   // boxShadow: [
                   //   BoxShadow(
                    //      color: Colors.black12,
                    //      blurRadius: 8,
                    //      offset: Offset(0, -2)),
                    //],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     // 📅 Daily Workout
Container(
  decoration: BoxDecoration(
    gradient: const LinearGradient(
      begin: Alignment(1.00, 1.00),
      end: Alignment(-0.24, -0.31),
      colors: [
        Color.fromARGB(255, 239, 243, 251),
        Color.fromARGB(255, 234, 240, 254),
      ],
    ),
    borderRadius: BorderRadius.circular(16), // rounded corners
  ),
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // space inside
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Daily Workout Schedule",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(22),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent, // transparent to show gradient
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
          ),
          onPressed: () {},
          child: const Text(
            "Check",
            style: TextStyle(
              fontSize: 14,
              color: Colors.white, // text color on gradient
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ],
  ),
),

                      const SizedBox(height: 20),

                      // 🔔 Upcoming Workout
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Upcoming Workout",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          Text("See more",
                              style: TextStyle(color: Colors.grey,fontSize: 13)),
                        ],
                      ),
                      const SizedBox(height: 12),

                      workoutTile(
                        "Fullbody Workout",
                        "Today, 03:00pm",
                        "https://img.icons8.com/color/96/yoga.png",
                        true,
                      ),
                      const SizedBox(height: 12),
                      workoutTile(
                        "Lowerbody Workout",
                        "June 05, 03:00pm",
                        "https://img.icons8.com/color/96/yoga.png",
                        false,
                      ),
                      const SizedBox(height: 20),

                      // ⚡ Training Options
                      const Text("What Do You Want to Train",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 12),

                      trainingCard("Fullbody Workout", "10 Poses | 40mins",
                          "https://img.icons8.com/color/96/yoga.png",context,FullBody()),
                      const SizedBox(height: 12),
                      trainingCard("Lowerbody Workout", "10 Poses | 30mins",
                          "https://img.icons8.com/color/96/yoga.png",context,LowerBody()),
                      const SizedBox(height: 12),
                      trainingCard("AB Workout", "10 Poses | 20mins",
                          "https://img.icons8.com/color/96/yoga.png",context,AbWorkout()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Workout Tile
  static Widget workoutTile(
      String title, String time, String img, bool enabled) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 8, spreadRadius: 2)
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(img), radius: 25),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(time,
                    style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
        Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    gradient: const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFFC58BF2),
        Color(0xFFB4C0FE),
      ],
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.all(2), // space for thumb
    child: FlutterSwitch(
      width: 50,
      height: 20,
      toggleSize: 18,
      value: enabled, // <-- use your boolean state here
      borderRadius: 30.0,
      padding: 2.0,
      activeColor: Colors.transparent, // keeps gradient visible
      inactiveColor: Colors.grey.shade300,
      activeToggleColor: Colors.white,
      inactiveToggleColor: Colors.white,
      showOnOff: false,
      onToggle: (val) {
          enabled = val; // <-- update state
        
      },
    ),
  ),
)
        ],
      ),
    );
  }

  /// Training Card
  static Widget trainingCard(
  String title,
  String subtitle,
  String img,
  BuildContext context,
  Widget nextPage,
) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment(1.00, 1.00),
        end: Alignment(-0.24, -0.31),
        colors: [
          Color.fromARGB(255, 239, 243, 251),
          Color.fromARGB(255, 234, 240, 254)
        ],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      children: [
        // Left side: Text + Button
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color.fromARGB(179, 93, 93, 93),
                ),
              ),
              const SizedBox(height: 10),

              // White button with gradient text
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 8),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => nextPage),
                  );
                },
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(
                      Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
                  child: const Text(
                    "View more",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white, // ignored, gradient applies
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),

        // Right side: Image
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            img,
            width: 90,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
      ],
    ),
  );
}
}

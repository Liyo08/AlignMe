import 'package:flutter/material.dart';


class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Stack(
                alignment: Alignment.center,
                children: [
                  const Center(
                    child: Text(
                      "Activity Tracker",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Today's Target heading + add button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Today's Target",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Today Target Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(205, 221, 227, 253),
                      Color.fromARGB(183, 199, 225, 251)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_drink,
                            color: Colors.blue, size: 30),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("8L",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Water Intake"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.directions_walk,
                            color: Colors.orange, size: 30),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("2400",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Foot Steps"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Activity Progress Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Activity Progress",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Weekly",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        SizedBox(width: 4),
                        Icon(Icons.keyboard_arrow_down,
                            color: Colors.white, size: 18),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Progress bars in a card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProgressBar(0, "Sun", 0.3),
                    _buildProgressBar(1, "Mon", 0.7),
                    _buildProgressBar(2, "Tue", 0.4),
                    _buildProgressBar(3, "Wed", 0.6),
                    _buildProgressBar(4, "Thu", 0.8),
                    _buildProgressBar(5, "Fri", 0.2),
                    _buildProgressBar(6, "Sat", 0.5),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Weekly Health Report Section
              const Text(
                "Weekly Health Report",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                 childAspectRatio: 3,  // Adjust this to control width vs. height
                children: [
                 _buildHealthReportCard(Icons.favorite, "72 bpm", "Heartbeat"),
_buildHealthReportCard(Icons.monitor_heart, "120/80", "Blood Pressure"),
_buildHealthReportCard(Icons.local_drink, "7.5L", "Water Intake"),
_buildHealthReportCard(Icons.air, "98%", "O2 Level"),
_buildHealthReportCard(Icons.health_and_safety, "Good", "Other Health"),
_buildHealthReportCard(Icons.local_hospital, "Normal", "Medical Checkup"),  // New item added

                ],
              ),

              const SizedBox(height: 20),

              // Latest Activity Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Latest Activity",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("See more", style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 15),

              // Activity Cards
              _buildActivityCard(context, "Drinking 300ml Water",
                  "About 3 minutes ago", Icons.local_drink, Colors.blue),

              const SizedBox(height: 10),

              _buildActivityCard(context, "Eat Snack (Fitbar)",
                  "About 10 minutes ago", Icons.fastfood, Colors.pink),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildProgressBar(
      int index, String day, double heightFactor) {
    final gradients = [
      const LinearGradient(
        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
      const LinearGradient(
        colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      ),
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 120,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: heightFactor,
              child: Container(
                decoration: BoxDecoration(
                  gradient: gradients[index % 2],
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(day),
      ],
    );
  }

  static Widget _buildActivityCard(BuildContext context, String title,
      String subtitle, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          if (Theme.of(context).brightness == Brightness.light)
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 1,
            ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey[400]
                          : Colors.grey,
                    ),
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            color: Theme.of(context).iconTheme.color,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  static Widget _buildHealthReportCard(
    IconData icon, String value, String label) {
  
  // Gradient and icon color logic
  List<Color> gradientColors = [Color(0xFF8F9EFF), Color(0xFFB0BBFF)];
  Color iconColor = Colors.blue;
  IconData backgroundPatternIcon = Icons.local_hospital;

  if (label == "Heartbeat") {
    gradientColors = [Color(0xFFFF8A80), Color(0xFFFF5252)];
    iconColor = Colors.red;
    backgroundPatternIcon = Icons.favorite;
  } else if (label == "Blood Pressure") {
    gradientColors = [Color(0xFFD1C4E9), Color(0xFF9575CD)];
    iconColor = Colors.purple;
    backgroundPatternIcon = Icons.monitor_heart;
  } else if (label == "Water Intake") {
    gradientColors = [Color(0xFF81D4FA), Color(0xFF29B6F6)];
    iconColor = Colors.blue;
    backgroundPatternIcon = Icons.water_drop;
  } else if (label == "O2 Level") {
    gradientColors = [Color(0xFF80CBC4), Color(0xFF26A69A)];
    iconColor = Colors.teal;
    backgroundPatternIcon = Icons.air;
  } else if (label == "Other Health") {
    gradientColors = [Color(0xFFA5D6A7), Color(0xFF66BB6A)];
    iconColor = Colors.green;
    backgroundPatternIcon = Icons.health_and_safety;
  } else if (label == "Medical Checkup") {
    gradientColors = [Color(0xFFFFCC80), Color(0xFFFFB74D)];
    iconColor = Colors.orange;
    backgroundPatternIcon = Icons.medical_services;
  }

  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: gradientColors.last.withOpacity(0.5),
          blurRadius: 8,
          spreadRadius: 1,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Stack(
      children: [
        // Background Pattern
        Positioned(
          top: -10,
          right: -10,
          child: Opacity(
            opacity: 0.1,
            child: Icon(
              backgroundPatternIcon,
              size: 80,
              color: Colors.white,
            ),
          ),
        ),
        // Main Content Row
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: Colors.white.withOpacity(0.3),
              child: Icon(icon, color: iconColor, size: 18),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
}
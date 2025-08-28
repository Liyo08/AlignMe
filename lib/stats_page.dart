import 'package:flutter/material.dart';

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Top bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context); // go back to home
                    },
                  ),
                  Row(
                    children: const [
                      Text(
                        "Activity Tracker",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(width: 6),
                     
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, color: Colors.black),
                    onPressed: () {},
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                   decoration: BoxDecoration(
  gradient: const LinearGradient(
    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight, // you can change direction
  ),
  borderRadius: BorderRadius.circular(12),
),
                    child: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Today Target card
              Container(
                padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
  gradient: const LinearGradient(
    colors: [Color.fromARGB(205, 221, 227, 253), Color.fromARGB(183, 199, 225, 251)],
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
                        const Icon(Icons.local_drink, color: Colors.blue, size: 30),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("8L", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Water Intake"),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.directions_walk, color: Colors.orange, size: 30),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("2400", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text("Foot Steps"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
// Activity Progress header
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    const Text(
      "Activity Progress",
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  // Gradient Chip Replacement
Container(
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
      SizedBox(width: 4),
      Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
    ],
  ),
),
  ],
),

const SizedBox(height: 12),

              // Progress bars inside a white card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildProgressBar(0,"Sun", 0.3),
                    _buildProgressBar(1,"Mon", 0.7),
                    _buildProgressBar(2,"Tue", 0.4),
                    _buildProgressBar(3,"Wed", 0.6),
                    _buildProgressBar(4,"Thu", 0.8),
                    _buildProgressBar(5,"Fri", 0.2),
                    _buildProgressBar(6,"Sat", 0.5),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Latest Activity header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Latest Activity",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("See more", style: TextStyle(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 12),

              // Activity cards
              _buildActivityCard("Drinking 300ml Water", "About 3 minutes ago",
                  Icons.local_drink, Colors.blue),
              const SizedBox(height: 10),
              _buildActivityCard("Eat Snack (Fitbar)", "About 10 minutes ago",
                  Icons.fastfood, Colors.pink),
            ],
          ),
        ),
      ),
    );
  }

  // progress bar widget
static Widget _buildProgressBar(int index, String day, double heightFactor) {
  // Two gradient options
  final gradients = [
    const LinearGradient(
      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)], // Blue shades
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    ),
    const LinearGradient(
      colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)], // Purple → Pink
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
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              decoration: BoxDecoration(
                gradient: gradients[index % 2], // alternate gradient
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
      const SizedBox(height: 6),
      Text(day, style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0))),
    ],
  );
}

  // latest activity card
  static Widget _buildActivityCard(
    String title, String subtitle, IconData icon, Color color) {
  return Container(
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
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
            Text(title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(subtitle,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),
        const Spacer(), // pushes the button to the right
        IconButton(
          icon: const Icon(Icons.more_horiz, color: Colors.black),
          onPressed: () {
            // action here
          },
        ),
      ],
    ),
  );
}

}

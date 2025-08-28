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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      color: Colors.blue,
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
                  color: Colors.blue[50],
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
                children: const [
                  Text("Activity Progress",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                 Chip(
  label: Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Text("Weekly", style: TextStyle(color: Colors.white)),
      SizedBox(width: 4),
      Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
    ],
  ),
  backgroundColor: Colors.blue,
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
                    _buildProgressBar("Sun", 0.3),
                    _buildProgressBar("Mon", 0.7),
                    _buildProgressBar("Tue", 0.4),
                    _buildProgressBar("Wed", 0.6),
                    _buildProgressBar("Thu", 0.8),
                    _buildProgressBar("Fri", 0.2),
                    _buildProgressBar("Sat", 0.5),
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
  static Widget _buildProgressBar(String day, double heightFactor) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 120,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: heightFactor,
              child: Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(day, style: const TextStyle(color: Colors.grey)),
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

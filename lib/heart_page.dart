import 'package:flutter/material.dart';

class HeartRatePage extends StatefulWidget {
  const HeartRatePage({super.key});

  @override
  State<HeartRatePage> createState() => _HeartRatePageState();
}

class _HeartRatePageState extends State<HeartRatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        title: const Text(
          "Heart Rate",
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Current Heart Rate
            const Text(
              "78 BPM",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color(0xFF92A3FD),
              ),
            ),
            const Text(
              "Normal Range",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Heart Health Score
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFC58BF2), Color(0xFFEEA4CE)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: const [
                  Text(
                    "Heart Health Score",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "85 / 100",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Your heart health is good. Keep exercising and maintain a balanced diet.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Tips
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Tips for a Healthy Heart",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.favorite, color: Colors.red),
                    title: Text("Exercise at least 30 minutes daily"),
                  ),
                  ListTile(
                    leading: Icon(Icons.local_drink, color: Colors.blue),
                    title: Text("Stay hydrated and avoid excess caffeine"),
                  ),
                  ListTile(
                    leading: Icon(Icons.food_bank, color: Colors.green),
                    title: Text("Eat more fruits, vegetables, and whole grains"),
                  ),
                  ListTile(
                    leading: Icon(Icons.bedtime, color: Colors.purple),
                    title: Text("Get enough quality sleep every night"),
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

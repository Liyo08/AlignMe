import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.notifications_none, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Illustration
              Center(
               // child: Image.asset(
               //   'assets/meditation.png', // Replace with your image asset
               //   height: 150,
                //),
              ),
              const SizedBox(height: 10),
              const Text(
                "Welcome Back,",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const Text(
                "Jeel",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // BMI Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF76C7C0), Color(0xFF91EAE4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BMI (Body Mass Index)",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(height: 4),
                          Text("You have a normal weight",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white)),
                          SizedBox(height: 10),
                          Chip(
                            label: Text("View More",
                                style: TextStyle(color: Colors.white)),
                            backgroundColor: Colors.pinkAccent,
                          ),
                        ],
                      ),
                    ),
                    // Circular progress (placeholder)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: CircularProgressIndicator(
                            value: 0.7,
                            backgroundColor: Colors.white30,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                          ),
                        ),
                        const Text(
                          "20.1",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Today Target Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFa18cd1), Color(0xFFfbc2eb)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Today Target",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    Chip(
                      label: Text("Check"),
                      backgroundColor: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Feature Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _featureCard("PosePerfect", "Align. Improve. Repeat.",
                      'assets/pose.png'),
                  _featureCard("FlowEase", "Breathe. Stretch. Heal.",
                      'assets/stretch.png'),
                ],
              ),
              const SizedBox(height: 20),
              _featureCard("AlignMart", "Essentials for your yoga journey.",
                  'assets/shop.png'),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }

  Widget _featureCard(String title, String subtitle, String asset) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(asset, height: 60), // Replace with real image assets
          const SizedBox(height: 10),
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.blue)),
        ],
      ),
    );
  }
}

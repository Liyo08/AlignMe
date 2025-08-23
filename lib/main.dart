import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



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
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
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
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
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
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Illustration
              const Center(),
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
                    begin: Alignment(1.00, 1.00),
                    end: Alignment(-0.24, -0.31),
                    colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                  ),
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                          const SizedBox(height: 4),
                          const Text("You have a normal weight",
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white)),
                          const SizedBox(height: 10),
                          Container(
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
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    begin: Alignment(1.00, 1.00),
                    end: Alignment(-0.24, -0.31),
                    colors: [
                      Color.fromARGB(255, 201, 208, 241),
                      Color.fromARGB(255, 223, 237, 251)
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Today Target",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Container(
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
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
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
              _featureCar("AlignMart", "Essentials for your yoga journey.",
                  'assets/shop.png'),

              // ---------------- Activity Status ----------------
              const SizedBox(height: 30),
              const Text("Activity Status",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),

              // Heart Rate card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Heart Rate", style: TextStyle(color: Colors.black54)),
                    SizedBox(height: 8),
                    Text("78 BPM",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue)),
                    SizedBox(height: 8),
                    Text("3 mins ago",
                        style: TextStyle(color: Colors.purple, fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Grid with Water, Sleep, Calories
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Water Intake
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black12, blurRadius: 6)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Water Intake",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text("4 Liters",
                              style: TextStyle(color: Colors.blue)),
                          SizedBox(height: 12),
                          Text("Real time updates",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Right column with Sleep & Calories
                  Expanded(
                    child: Column(
                      children: [
                        // Sleep
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 6)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Sleep",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text("8h 20m",
                                  style: TextStyle(color: Colors.purple)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Calories
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black12, blurRadius: 6)
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text("Calories",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 8),
                              Text("760 kcal",
                                  style: TextStyle(color: Colors.orange)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }

  Widget _featureCard(String title, String subtitle, String asset) {
    return Container(
      width: 175,
      padding: const EdgeInsets.all(22),
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
          Image.asset(asset, height: 60),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _featureCar(String title, String subtitle, String asset) {
    return Container(
      width: 440,
      padding: const EdgeInsets.all(22),
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
          Image.asset(asset, height: 60),
          const SizedBox(height: 10),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 14)),
          Text(subtitle,
              style: const TextStyle(fontSize: 12, color: Colors.blue)),
        ],
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 70,
          margin: const EdgeInsets.only(
              left: 16, right: 16, bottom: 24, top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
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
              _navItem(Icons.home, true,
                  const Color.fromARGB(255, 227, 137, 245)),
              _navItem(Icons.bar_chart, false, Colors.grey),
              const SizedBox(width: 70),
              _navItem(Icons.camera_alt_outlined, false, Colors.grey),
              _navItem(Icons.person_outline, false, Colors.grey),
            ],
          ),
        ),
        Positioned(
          bottom: 40,
          child: Container(
            height: 75,
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
            child: const Icon(Icons.search,
                color: Colors.white, size: 32),
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, bool active, Color color) {
    return Icon(icon, color: color, size: 28);
  }
}

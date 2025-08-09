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
          padding: EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.all(8), // space inside the box
            decoration: BoxDecoration(
              color: Colors.white, // box background color
              borderRadius: BorderRadius.circular(12), // rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05), // light shadow
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: 24, // adjust icon size
            ),
          ),
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.pinkAccent),
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
                    Text("Today Target",
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
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
              _featureCard("AlignMart", "Essentials for your yoga journey.",
                  'assets/shop.png'),
            ],
          ),
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: CustomBottomNavBar(),
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

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // allow overflow
      alignment: Alignment.bottomCenter,
      children: [
        // Background container
        Container(
          height: 70,
          margin:
              const EdgeInsets.only(left: 16, right: 16, bottom: 24, top: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(
                  Icons.home, true, const Color.fromARGB(255, 227, 137, 245)),
              _navItem(Icons.bar_chart, false, Colors.grey),
              const SizedBox(width: 70), // space for bigger center button
              _navItem(Icons.camera_alt_outlined, false, Colors.grey),
              _navItem(Icons.person_outline, false, Colors.grey),
            ],
          ),
        ),

        // Floating bigger center button
        Positioned(
          bottom: 40, // raise it above the bar
          child: Container(
            height: 75, // bigger size
            width: 75,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(1.00, 1.00),
                end: Alignment(-0.24, -0.31),
                colors: [const Color(0xFF92A3FD), const Color(0xFF9DCEFF)],
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
            child: const Icon(Icons.search, color: Colors.white, size: 32),
          ),
        ),
      ],
    );
  }

  Widget _navItem(IconData icon, bool active, Color color) {
    return Icon(icon, color: color, size: 28);
  }
}


import 'package:flutter/material.dart';
import 'signup_page.dart';

class SplashPage1 extends StatelessWidget {
  const SplashPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // light grey background
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2), // 👈 Pushes content down a bit

            // Center Icon
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.blue[100],
              child: const Icon(
                Icons.self_improvement, // meditation icon
                color: Colors.black,
                size: 40,
              ),
            ),
            const SizedBox(height: 30),

            // Title
            const Text(
              "Align Fit",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),

            // Subtitle
            const Text(
              "“ Balance your mind and body ”",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black87,
                fontStyle: FontStyle.italic,
              ),
            ),

            const Spacer(flex: 2), // 👈 Push arrows closer to bottom

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Dot(isActive: true),
                Dot(isActive: false),
                Dot(isActive: false),
              ],
            ),
            const SizedBox(height: 20), // 👈 Adjust this to move arrows up/down

            // Next Button
            Container(
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage2()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // make it transparent
      shadowColor: Colors.transparent,     // remove shadow
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(16),
    ),
    child: const Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 28,
    ),
  ),
),

            const Spacer(), // 👈 Leaves space below arrows
          ],
        ),
      ),
    );
  }
}

class SplashPage2 extends StatelessWidget {
  const SplashPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Center Image
            Image.asset(
              "assets/images/meditation.png",
              height: 200,
            ),
            const SizedBox(height: 40),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "“ Guided meditation to relax your mind ”",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const Spacer(flex: 2),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Dot(isActive: false),
                Dot(isActive: true),
                Dot(isActive: false),
              ],
            ),
            const SizedBox(height: 20),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Back Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // go back to Page 1
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    elevation: 2,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 26,
                  ),
                ),

                // Next Button
               Container(
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage3()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // make it transparent
      shadowColor: Colors.transparent,     // remove shadow
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(16),
    ),
    child: const Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 28,
    ),
  ),
),
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class SplashPage3 extends StatelessWidget {
  const SplashPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            Image.asset(
              "assets/splash3.png",
              height: 250,
            ),

            const SizedBox(height: 30),

            const Text(
              "Track Your Progress",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 15),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Monitor workouts and measure improvements with ease using our smart fitness tracker.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const Spacer(flex: 2),

            // Dots Indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Dot(isActive: false),
                Dot(isActive: false),
                Dot(isActive: true),
              ],
            ),
            const SizedBox(height: 20),

            // Navigation Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Back Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // goes back to SplashPage2
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(16),
                    elevation: 2,
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 26,
                  ),
                ),

                // Next → Goes to Login
                Container(
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SignInPage()),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent, // make it transparent
      shadowColor: Colors.transparent,     // remove shadow
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(16),
    ),
    child: const Icon(
      Icons.arrow_forward,
      color: Colors.white,
      size: 28,
    ),
  ),
)
              ],
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}

/// 🔹 Reusable Dot widget (used in all 3 pages)
class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({super.key, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black87 : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

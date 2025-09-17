
import 'package:flutter/material.dart';
import 'signup_page.dart';

class SplashPage1 extends StatelessWidget {
  const SplashPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF92A3FD),
            Color(0xFF9DCEFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Make scaffold transparent
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Center Icon
              CircleAvatar(
  radius: 40,
  backgroundColor: const Color(0xFF92A3FD), // Match the gradient color
  child: const Icon(
    Icons.self_improvement,
    color: Colors.white, // White icon for good contrast
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
                  color: Colors.white, // Changed to white for contrast
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              const Text(
                "“ Balance your mind and body ”",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70, // Changed for better visibility
                  fontStyle: FontStyle.italic,
                ),
              ),

              const Spacer(flex: 2),

              // Dots Indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Dot(isActive: true),
                  Dot(isActive: false),
                  Dot(isActive: false),
                ],
              ),
              const SizedBox(height: 20),

              // Next Button
             Container(
  decoration: const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(
      colors: [
        Colors.white,
        Color.fromARGB(255, 218, 216, 216), // Slight variation for a subtle gradient
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashPage2(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      shape: const CircleBorder(),
      padding: const EdgeInsets.all(16),
    ),
    child: const Icon(
      Icons.arrow_forward,
      color: Color(0xFF3B5998), // Blue color for arrow icon
      size: 28,
    ),
  ),
),


              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}


class SplashPage2 extends StatelessWidget {
  const SplashPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF92A3FD),
            Color(0xFF9DCEFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Transparent scaffold
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Center Image
              Image.asset(
                "assets/splashpage2.png",
                height: 200,
              ),
              const SizedBox(height: 40),

              const Text(
                "Enjoy the Power of Meditation",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White for contrast
                ),
              ),
              const SizedBox(height: 8),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "“ Guided meditation to relax your mind ”",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70, // Slightly transparent white
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
                  // Back Button with gradient style
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
                        Navigator.pop(context); // Go back
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white, // White icon
                        size: 26,
                      ),
                    ),
                  ),

                  // Next Button (same gradient)
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
      colors: [
        Colors.white,
        Color.fromARGB(255, 218, 216, 216), // Slight variation for a subtle gradient
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SplashPage3()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF3B5998),
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
      ),
    );
  }
}


class SplashPage3 extends StatelessWidget {
  const SplashPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF92A3FD),
            Color(0xFF9DCEFF),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // Transparent scaffold
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(flex: 2),

              Image.asset(
                "assets/splashpage3.png",
                height: 250,
              ),

              const SizedBox(height: 30),

              const Text(
                "Track Your Progress",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // White text for contrast
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "“Monitor workouts and measure improvements with ease using our smart fitness tracker”",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.white70, // Slightly transparent white
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

              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Back Button
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
                        Navigator.pop(context); // Go back
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white, // White icon
                        size: 26,
                      ),
                    ),
                  ),

                  // Next Button (to SignInPage)
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                      
      colors: [
        Colors.white,
        Color.fromARGB(255, 218, 216, 216), // Slight variation for a subtle gradient
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
                      ),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Color(0xFF3B5998),
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
        color: isActive ? const Color.fromARGB(221, 255, 255, 255) : const Color.fromARGB(112, 198, 198, 198),
        shape: BoxShape.circle,
      ),
    );
  }
}

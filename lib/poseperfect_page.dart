import 'package:flutter/material.dart';

class PosePerfectPage extends StatelessWidget {
  const PosePerfectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔹 Custom scrollable header (instead of AppBar)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      "Pose Perfect",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz, color: Colors.black),
                      onPressed: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // This is a placeholder for the graph section
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade100, Colors.white],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Graph Placeholder",
                      style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

         // Daily Workout Schedule inside a light blue curved box
Container(
  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // inner spacing
decoration: BoxDecoration(
  gradient: const LinearGradient(
     begin: Alignment(1.00, 1.00),
                  end: Alignment(-0.24, -0.31),
                  colors: [
                     Color.fromARGB(255, 248, 249, 255),
                     Color.fromARGB(255, 223, 246, 255)
                  ],
    // if you want to exactly match 274deg, we can tweak begin/end
  ),
  borderRadius: BorderRadius.circular(20),
),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Daily Workout Schedule",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ), // 👈 control button size
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            // your onPressed action
          },
          child: const Text(
            "Check",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 20),


                // Upcoming Workout
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Upcoming Workout",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "See more",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Fullbody Workout Item
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.purple, // Placeholder color
                        radius: 25,
                        child: Icon(Icons.fitness_center, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fullbody Workout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Today, 03:00pm",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Switch(
                        value: true,
                        onChanged: (bool value) {},
                        activeColor: Colors.purple,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 10),

                // Lowerbody Workout Item
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.orange, // Placeholder color
                        radius: 25,
                        child: Icon(Icons.self_improvement, color: Colors.white),
                      ),
                      const SizedBox(width: 15),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lowerbody Workout",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "June 05, 02:00pm",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Switch(
                        value: false,
                        onChanged: (bool value) {},
                        activeColor: Colors.purple,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // What Do You Want to Train
                const Text(
                  "What Do You Want to Train",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // Fullbody Workout Card
                _buildWorkoutCard(
                  context,
                  title: "Fullbody Workout",
                  details: "10 Poses | 40mins",
                  imageAsset: "assets/fullbody.png", // Replace with your image
                ),
                const SizedBox(height: 10),

                // Lowerbody Workout Card
                _buildWorkoutCard(
                  context,
                  title: "Lowerbody Workout",
                  details: "10 Poses | 40mins",
                  imageAsset: "assets/lowerbody.png", // Replace with your image
                ),
                const SizedBox(height: 10),

                // AB Workout Card
                _buildWorkoutCard(
                  context,
                  title: "AB Workout",
                  details: "10 Poses | 20mins",
                  imageAsset: "assets/ab_workout.png", // Replace with your image
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkoutCard(
    BuildContext context, {
    required String title,
    required String details,
    required String imageAsset,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                details,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  
                ),
                child: Text(
                  "View more",
                  style: TextStyle(color: Color(0xFF92A3FD)),
                ),
              ),
            ],
          ),
          // Placeholder for the image
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              // If you have images, use this:
              // image: DecorationImage(
              //   image: AssetImage(imageAsset),
              //   fit: BoxFit.cover,
              // ),
            ),
            child: const Center(
              child: Text("Image", style: TextStyle(color: Colors.black54)),
            ),
          ),
        ],
      ),
    );
  }
}

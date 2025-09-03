import 'package:flutter/material.dart';

class FullBody extends StatelessWidget {
  const FullBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top Image and Back Button
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 14, 16, 16),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                  child: Image.asset(
                    'assets/yoga_pose.png', // Replace with your image
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Workout Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fullbody Workout',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '10 Poses | 10 min | 100 calories burn',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.schedule),
                        label: Text('Schedule Workout',style: TextStyle(color: Colors.white),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Beginner',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // You'll Need Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "You'll Need",
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: const [
                          Icon(Icons.check_box_outline_blank, size: 40),
                          SizedBox(height: 5),
                          Text('Mat')
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.local_drink, size: 40),
                          SizedBox(height: 5),
                          Text('Bottle / Liters')
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.access_time, size: 40),
                          SizedBox(height: 5),
                          Text('Timer')
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Pose List
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    poseTile('Cat - Cow', '03:00'),
                    poseTile('Downward Dog', '03:00'),
                    poseTile('Low Lunge', '03:00'),
                    poseTile('Standing Forward Bend', '03:00'),
                    poseTile('Chair Pose', '02:00'),
                    poseTile('Warrior I', '02:00'),
                    poseTile('Plank Pose', '02:00'),
                    poseTile('Bridge Pose', '03:00'),
                    poseTile('Pigeon Pose', '03:00'),
                  ],
                ),
              ),
            ),

            // Start Workout Button
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  child: const Text(
                    'Start Workout',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget poseTile(String name, String time) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 5),
      leading: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.self_improvement, color: Colors.white),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: Text(time),
    );
  }
}

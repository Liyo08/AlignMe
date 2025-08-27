import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
 

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 🔹 Top Bar (Back + Title + Menu)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, size: 28),
                    onPressed: () {
                       Navigator.pop(context);
                    },
                  ),
                  const Text(
                    "Profile",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz, size: 28),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // 🔹 Profile Header
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: AssetImage(""), // replace with your asset
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jeel",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Lose weight Program",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    padding: EdgeInsets.zero, // remove default padding
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.transparent, // make button transparent
    shadowColor: Colors.transparent, // remove default shadow color
  ),
  child: Ink(
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      alignment: Alignment.center,
      child: const Text(
        "Edit",
        style: TextStyle(color: Colors.white), // make text visible
      ),
    ),
  ),
)
                ],
              ),
              const SizedBox(height: 20),

              // 🔹 Stats Row
         Padding(
  padding: const EdgeInsets.only(bottom: 20), // 👈 bottom padding
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(child: _buildStatCard("180cm", "Height")),
      const SizedBox(width: 10), 
      Expanded(child: _buildStatCard("65kg", "Weight")),
      const SizedBox(width: 10),
      Expanded(child: _buildStatCard("22yo", "Age")),
    ],
  ),
),


              // 🔹 Account Section
              _buildSection(
                title: "Account",
                items: [
                  _buildListTile(Icons.person_outline, "Personal Data"),
                  _buildListTile(Icons.emoji_events_outlined, "Achievement"),
                  _buildListTile(Icons.history, "Activity History"),
                  _buildListTile(Icons.fitness_center, "Workout Progress"),
                ],
              ),

              // 🔹 Notification Section
             
_buildSection(
  title: "Notification",
  items: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(Icons.notifications_outlined, color: Colors.purple),
            SizedBox(width: 8),
           Text(
  "Pop-up Notification",
  style: TextStyle(
    fontSize: 15,       // increase/decrease as needed
    fontWeight: FontWeight.w500, // optional, for bolder look
    color: Colors.black, // optional, set custom color
  ),
),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFC58BF2),
                Color(0xFFB4C0FE),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2), // space for thumb
            child: FlutterSwitch(
              width: 50,
              height: 20,
              toggleSize: 26,
              value: true,
              borderRadius: 30.0,
              padding: 2.0,
              activeColor: Colors.transparent, // show gradient
              inactiveColor: Colors.grey.shade300,
              activeToggleColor: Colors.white,
              inactiveToggleColor: Colors.white,
              showOnOff: false,
              onToggle: (val) {
                // handle toggle state
              },
            ),
          ),
        ),
      ],
    ),
  ],
),
              // 🔹 Other Section
              _buildSection(
                title: "Other",
                items: [
                  _buildListTile(Icons.mail_outline, "Contact Us"),
                  _buildListTile(Icons.privacy_tip_outlined, "Privacy Policy"),
                  _buildListTile(Icons.settings_outlined, "Settings"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Stat Card
  Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

  // 🔹 Reusable Section
  Widget _buildSection({required String title, required List<Widget> items}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }

  // 🔹 Reusable ListTile
  Widget _buildListTile(IconData icon, String text) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}

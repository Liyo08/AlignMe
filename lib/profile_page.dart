import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'main.dart';
import 'package:fl_chart/fl_chart.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
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
                      if (Navigator.of(context).canPop()) {
                        // Case 1: FullBody was opened with Navigator.push()
                        Navigator.of(context).pop();
                      } else {
                        // Case 2: FullBody is inside navbar (no stack to pop)
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CustomBottomNavBar()),
                        );
                      }
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                      backgroundColor:
                          Colors.transparent, // make button transparent
                      shadowColor:
                          Colors.transparent, // remove default shadow color
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 8),
                        alignment: Alignment.center,
                        child: const Text(
                          "Edit",
                          style: TextStyle(
                              color: Colors.white), // make text visible
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
                  _buildListTile(Icons.person_outline, "Personal Data",
                      const PersonalDataPage(), context),
                  _buildListTile(Icons.emoji_events_outlined, "Achievement",
                      const AchievementPage(), context),
                  _buildListTile(Icons.history, "Activity History",
                      const ActivityHistoryPage(), context),
                  _buildListTile(Icons.fitness_center, "Workout Progress",
                      const WorkoutProgressPage(), context),
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
                          Icon(Icons.notifications_outlined,
                              color: Color.fromARGB(255, 207, 138, 219)),
                          SizedBox(width: 8),
                          Text(
                            "Pop-up Notification",
                            style: TextStyle(
                              fontSize: 15, // increase/decrease as needed
                              fontWeight:
                                  FontWeight.w500, // optional, for bolder look
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
                  _buildListTile(Icons.mail_outline, "Contact Us",
                      const ContactUsPage(), context),
                  _buildListTile(Icons.privacy_tip_outlined, "Privacy Policy",
                      const PrivacyPolicyPage(), context),
                  _buildListTile(Icons.settings_outlined, "Settings",
                      const SettingsPage(), context),
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
          // Gradient for value
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // keep white to show gradient
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Normal black label
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
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
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }

  // 🔹 Reusable ListTile
  Widget _buildListTile(
      IconData icon, String text, Widget page, BuildContext context) {
    return ListTile(
      leading: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Icon(
          icon,
          color: Colors.white, // masked by gradient
        ),
      ),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}

class PersonalDataPage extends StatelessWidget {
  const PersonalDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // same background as ProfilePage
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Bar (Back + Title)
             Row(
  children: [
    IconButton(
      icon: const Icon(Icons.arrow_back, size: 28),
      onPressed: () => Navigator.pop(context),
    ),
    const Expanded(
      child: Center(
        child: Text(
          "Personal Data",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
    ),
    const SizedBox(width: 48), // same width as IconButton for balance
  ],
),
              const SizedBox(height: 20),

              // 🔹 Profile Picture + Name
              Center(
                child: Column(
                  children: const [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage:
                          AssetImage(""), // replace with real image
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jeel",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Age: 21",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 🔹 Details Section
              _buildSection(
                title: "Basic Information",
                items: [
                  _buildInfoRow("Full Name", "Jeel"),
                  _buildInfoRow("Age", "21"),
                  _buildInfoRow("Height", "180 cm"),
                  _buildInfoRow("Weight", "65 kg"),
                ],
              ),
              _buildSection(
                title: "Contact Information",
                items: [
                  _buildInfoRow("Email", "jeel@example.com"),
                  _buildInfoRow("Phone", "+91 98765 43210"),
                ],
              ),
              _buildSection(
                title: "Other",
                items: [
                  _buildInfoRow("Goal", "Lose Weight"),
                  _buildInfoRow("Activity Level", "Moderate"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Section (same style as ProfilePage)
  static Widget _buildSection(
      {required String title, required List<Widget> items}) {
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
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          ...items,
        ],
      ),
    );
  }

  // 🔹 Reusable Info Row
  static Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 15, color: Colors.black54)),
          Text(value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class AchievementPage extends StatelessWidget {
  const AchievementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ White background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 28, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Achievements",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.black87,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Ranking & Points Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF9DCEFF), Color(0xFFD6A4FF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _InfoColumn(title: "Your Rank", value: "#42", dark: false),
                  _InfoColumn(title: "Total Points", value: "3,450", dark: false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🔹 Pathway Achievements
            const Text(
              "Achievement Pathway",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildPathwayItem("First Workout", true, 200),
            _buildPathwayItem("7-Day Streak", true, 500),
            _buildPathwayItem("30-Day Streak", false, 1000),
            _buildPathwayItem("100 Workouts", false, 2000),
            _buildPathwayItem("1 Year Consistency", false, 5000),

            const SizedBox(height: 20),

            // 🔹 Completed Achievements
            const Text(
              "Completed",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildAchievementCard(
              "First Workout",
              "Completed your very first workout!",
              200,
              true,
            ),
            _buildAchievementCard(
              "7-Day Streak",
              "Worked out for 7 days in a row!",
              500,
              true,
            ),

            const SizedBox(height: 20),

            // 🔹 Locked Achievements
            const Text(
              "Locked",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            _buildAchievementCard(
              "30-Day Streak",
              "Keep going! 30 days of consistency unlocks this.",
              1000,
              false,
            ),
            _buildAchievementCard(
              "100 Workouts",
              "Complete 100 workouts to unlock this.",
              2000,
              false,
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Pathway Item
  Widget _buildPathwayItem(String title, bool completed, int points) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: completed
                ? const Color(0xFF92A3FD)
                : Colors.grey.shade300,
            child: Icon(
              completed ? Icons.check : Icons.lock,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: completed ? Colors.black87 : Colors.black54,
                  ),
                ),
                Text(
                  "+$points points",
                  style: TextStyle(
                    fontSize: 13,
                    color: completed
                        ? const Color(0xFF92A3FD)
                        : Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Achievement Card
  Widget _buildAchievementCard(
      String title, String description, int points, bool completed) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: completed
            ? const LinearGradient(
                colors: [Color(0xFF9DCEFF), Color(0xFFD6A4FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: completed ? null : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: completed ? Colors.transparent : Colors.grey.shade300,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            completed ? Icons.emoji_events : Icons.lock_outline,
            color: completed ? Colors.white : Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: completed ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: completed ? Colors.white70 : Colors.black54,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "+$points points",
                  style: TextStyle(
                    fontSize: 13,
                    color: completed
                        ? Colors.white
                        : Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 🔹 Info Column (for rank/points)
class _InfoColumn extends StatelessWidget {
  final String title;
  final String value;
  final bool dark; // switch for white vs gradient card

  const _InfoColumn({
    required this.title,
    required this.value,
    this.dark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: dark ? Colors.black54 : Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: dark ? Colors.black87 : Colors.white,
          ),
        ),
      ],
    );
  }
}
class ActivityHistoryPage extends StatelessWidget {
  const ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ clean white background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Activity History",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildActivityCard(
              icon: Icons.directions_run,
              title: "Morning Run",
              subtitle: "5.2 km • 32 mins",
              date: "Today, 6:30 AM",
              gradient: const [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
            ),
            const SizedBox(height: 16),
            _buildActivityCard(
              icon: Icons.fitness_center,
              title: "Gym Workout",
              subtitle: "Chest & Arms • 45 mins",
              date: "Yesterday, 5:00 PM",
              gradient: const [Color(0xFF9DCEFF), Color(0xFFD6A4FF)],
            ),
            const SizedBox(height: 16),
            _buildActivityCard(
              icon: Icons.directions_bike,
              title: "Cycling",
              subtitle: "12 km • 50 mins",
              date: "Mon, 7:15 AM",
              gradient: const [Color(0xFFD6A4FF), Color(0xFF92A3FD)],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String date,
    required List<Color> gradient,
  }) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 6),
                Text(date,
                    style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        ],
      ),
    );
  }
}

class WorkoutProgressPage extends StatefulWidget {
  const WorkoutProgressPage({super.key});

  @override
  State<WorkoutProgressPage> createState() => _WorkoutProgressPageState();
}

class _WorkoutProgressPageState extends State<WorkoutProgressPage> {
  String selectedRange = "Week"; // toggle between Week / Month

  // Sample data
  final Map<String, List<double>> usageData = {
    "Week": [2, 3.5, 4, 5, 2.5, 4.2, 6],
    "Month": [12, 10, 15, 20, 25, 18, 30],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // ✅ Clean background
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
             Stack(
  alignment: Alignment.center,
  children: [
    // Back button (aligned to left)
    Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black87),
        onPressed: () => Navigator.pop(context),
      ),
    ),

    // Centered title
    const Text(
      "Workout Progress",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    ),
  ],
),

                const SizedBox(height: 20),
            // --- Usage Time Graph ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _sectionTitle("App Usage Time"),
                DropdownButton<String>(
                  value: selectedRange,
                  underline: const SizedBox(),
                  items: const [
                    DropdownMenuItem(value: "Week", child: Text("Last Week")),
                    DropdownMenuItem(value: "Month", child: Text("Last Month")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedRange = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final labels = selectedRange == "Week"
                              ? ["M", "T", "W", "T", "F", "S", "S"]
                              : ["W1", "W2", "W3", "W4", "W5", "W6", "W7"];
                          if (value.toInt() < labels.length) {
                            return Text(labels[value.toInt()]);
                          }
                          return const Text("");
                        },
                      ),
                    ),
                  ),
                  barGroups: List.generate(
                    usageData[selectedRange]!.length,
                    (i) => BarChartGroupData(
                      x: i,
                      barRods: [
                        BarChartRodData(
                          toY: usageData[selectedRange]![i],
                          gradient: _barGradient(),
                          width: 18,
                          borderRadius: BorderRadius.circular(6),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
        
            // --- Quick Health Summary ---
            _sectionTitle("Health Summary"),
            const SizedBox(height: 12),
            Center(
              child: Wrap(
                alignment: WrapAlignment.center, // ✅ centers content
                spacing: 16,
                runSpacing: 16,
                children: [
                  _buildSummaryCard(Icons.favorite, "Heart Rate", "78 bpm",
                      [const Color(0xFF92A3FD), const Color(0xFF9DCEFF)]),
                  _buildSummaryCard(Icons.local_drink, "Water", "2.5 L",
                      [const Color(0xFF9DCEFF), const Color(0xFFD6A4FF)]),
                  _buildSummaryCard(Icons.local_fire_department, "Calories",
                      "1850 kcal", [const Color(0xFFD6A4FF), const Color(0xFF92A3FD)]),
                  _buildSummaryCard(Icons.fastfood, "Food", "Protein-rich",
                      [const Color(0xFF92A3FD), const Color(0xFFD6A4FF)]),
                  _buildSummaryCard(Icons.fitness_center, "Activities",
                      "Running + Gym", [const Color(0xFF9DCEFF), const Color(0xFF92A3FD)]),
                  _buildSummaryCard(Icons.bedtime, "Sleep", "7h 15m",
                      [const Color(0xFFD6A4FF), const Color(0xFF9DCEFF)]),
                ],
              ),
            ),
            const SizedBox(height: 24),
        
            // --- Before vs After ---
            _sectionTitle("Progress"),
            const SizedBox(height: 12),
            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12), // space from edges
          child: Row(
            children: [
        Expanded(
          child: _buildProgressCard(
            "Before",
            "Weight: 75kg\nBMI: 26",
            Icons.person_off,
            [const Color(0xFF92A3FD), const Color(0xFF9DCEFF)],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildProgressCard(
            "Now",
            "Weight: 70kg\nBMI: 23",
            Icons.person,
            [const Color(0xFFD6A4FF), const Color(0xFF92A3FD)],
          ),
        ),
            ],
          ),
        )
        ,
          ],
        ),
      ),
    );
  }

  // --- Gradient for graph bars ---
  static LinearGradient _barGradient() => const LinearGradient(
        colors: [Color(0xFF92A3FD), Color(0xFFD6A4FF)],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  // --- Section Title ---
  Widget _sectionTitle(String text) => Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      );

  // --- Summary Card ---
  Widget _buildSummaryCard(
      IconData icon, String title, String value, List<Color> gradient) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 28),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 6),
          Text(value,
              style: const TextStyle(fontSize: 16, color: Colors.white70)),
        ],
      ),
    );
  }

  // --- Before vs After Progress Card ---
  Widget _buildProgressCard(
      String title, String details, IconData icon, List<Color> gradient) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: gradient),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: gradient.last.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 36),
          const SizedBox(height: 12),
          Text(title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          const SizedBox(height: 6),
          Text(details,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }
}

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contact Us")),
      body: const Center(child: Text("Contact Us Page")),
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Privacy Policy")),
      body: const Center(child: Text("Privacy Policy Page")),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(child: Text("Settings Page")),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'main.dart';
import 'package:fl_chart/fl_chart.dart';
import 'notification_page.dart';
import 'themeselection_page.dart';
import 'package:shared_preferences/shared_preferences.dart'; // For persisting selected language


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    icon: const Icon(Icons.arrow_back_ios_new),
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
                 CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFF92A3FD),
                    child:
                        const Icon(Icons.person, size: 40, color: Colors.white),
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
                    Expanded(child: _buildStatCard(context, "180cm", "Height")),
                    const SizedBox(width: 10),
                    Expanded(child: _buildStatCard(context, "65kg", "Weight")),
                    const SizedBox(width: 10),
                    Expanded(child: _buildStatCard(context, "22yo", "Age")),
                  ],
                ),
              ),

              // 🔹 Account Section
              _buildSection(
                  title: "Account",
                  items: [
                    _buildListTile(Icons.person_outline, "Personal Data",
                        const PersonalDataPage(), context),_divider(context),
                    _buildListTile(Icons.emoji_events_outlined, "Achievement",
                        const AchievementPage(), context),_divider(context),
                    _buildListTile(Icons.history, "Activity History",
                        const ActivityHistoryPage(), context),_divider(context),
                    _buildListTile(Icons.fitness_center, "Workout Progress",
                        const WorkoutProgressPage(), context),
                  ],
                  context: context),

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
                                  fontWeight: FontWeight
                                      .w500 // optional, for bolder look
                                  // optional, set custom color
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
                  context: context),
              // 🔹 Other Section
              _buildSection(
                  title: "Other",
                  items: [
                    _buildListTile(Icons.mail_outline, "Contact Us",
                        const ContactUsPage(), context),_divider(context),
                    _buildListTile(Icons.privacy_tip_outlined, "Privacy Policy",
                        const PrivacyPolicyPage(), context),_divider(context),
                    _buildListTile(Icons.settings_outlined, "Settings",
                        const SettingsPage(), context),
                  ],
                  context: context),
            ],
          ),
        ),
      ),
    );
  }
static Widget _divider(BuildContext context) {
  // Choose color based on light/dark mode
  final Color dividerColor = Theme.of(context).brightness == Brightness.dark
      ? Colors.grey[300]! // light grey for dark mode
      :const Color.fromARGB(255, 179, 179, 179); // dark grey/black-grey for light mode

  return Divider(
    height: 1,
    thickness: 0.5,
    color: dividerColor,
    indent: 16,
    endIndent: 16,
  );
}
  // 🔹 Reusable Stat Card
  Widget _buildStatCard(context, String value, String label) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
            ),
          ),
        ],
      ),
    );
  }

  // 🔹 Reusable Section
  Widget _buildSection(
      {required String title,
      required List<Widget> items,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // same background as ProfilePage
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
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Personal Data",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(
                      width: 48), // same width as IconButton for balance
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
                  context: context),
              _buildSection(
                  title: "Contact Information",
                  items: [
                    _buildInfoRow("Email", "jeel@example.com"),
                    _buildInfoRow("Phone", "+91 98765 43210"),
                  ],
                  context: context),
              _buildSection(
                  title: "Other",
                  items: [
                    _buildInfoRow("Goal", "Lose Weight"),
                    _buildInfoRow("Activity Level", "Moderate"),
                  ],
                  context: context),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Reusable Section (same style as ProfilePage)
  static Widget _buildSection(
      {required String title,
      required List<Widget> items,
      required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
          Text(label, style: const TextStyle(fontSize: 15)),
          Text(value,
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
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
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // ✅ White background

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Custom header (scrollable instead of AppBar)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Achievements",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // balance for symmetry
                ],
              ),
              const SizedBox(height: 20),
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
                    _InfoColumn(
                        title: "Total Points", value: "3,450", dark: false),
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
            backgroundColor:
                completed ? const Color(0xFF92A3FD) : Colors.grey.shade300,
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
                    //color: completed ? Colors.black87 : Colors.black54,
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
                    color: completed ? Colors.white : Colors.grey.shade600,
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
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // ✅ clean white background

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              // Scrollable Header (instead of AppBar)
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Activity History",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // balance for symmetry
                ],
              ),
              const SizedBox(height: 20),
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
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 14)),
                const SizedBox(height: 6),
                Text(date,
                    style:
                        const TextStyle(color: Colors.white70, fontSize: 12)),
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
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // ✅ Clean background
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
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Centered title
                const Text(
                  "Workout Progress",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                  _buildSummaryCard(
                      Icons.local_fire_department,
                      "Calories",
                      "1850 kcal",
                      [const Color(0xFFD6A4FF), const Color(0xFF92A3FD)]),
                  _buildSummaryCard(Icons.fastfood, "Food", "Protein-rich",
                      [const Color(0xFF92A3FD), const Color(0xFFD6A4FF)]),
                  _buildSummaryCard(
                      Icons.fitness_center,
                      "Activities",
                      "Running + Gym",
                      [const Color(0xFF9DCEFF), const Color(0xFF92A3FD)]),
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
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 12), // space from edges
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
            ),
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom scrollable header
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Contact Us",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // keep balance
                ],
              ),
              const SizedBox(height: 24),

              // Intro text
              const Text(
                "We’d love to hear from you! Reach out via email, phone, or visit us.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 28),

              // Contact cards
              _buildContactCard(
                icon: Icons.email_outlined,
                title: "Email",
                subtitle: "support@fitnessapp.com",
                gradient: const [
                  Color(0xFF8EC5FC),
                  Color(0xFFE0C3FC)
                ], // blue → lavender
              ),
              const SizedBox(height: 18),

              _buildContactCard(
                icon: Icons.phone_outlined,
                title: "Phone",
                subtitle: "+91 98765 43210",
                gradient: const [
                  Color.fromARGB(255, 246, 194, 251),
                  Color(0xFFA6C1EE)
                ], // pink → blue
              ),
              const SizedBox(height: 18),

              _buildContactCard(
                icon: Icons.location_on_outlined,
                title: "Office",
                subtitle: "123, Fitness Street\nBangalore, India",
                gradient: const [
                  Color.fromARGB(255, 168, 230, 255),
                  Color.fromARGB(255, 233, 171, 254)
                ], // sky blue → soft pink
              ),
              const SizedBox(height: 18),

              _buildContactCard(
                icon: Icons.public,
                title: "Website",
                subtitle: "www.fitnessapp.com",
                gradient: const [
                  Color.fromARGB(255, 244, 199, 254),
                  Color.fromARGB(255, 177, 217, 255)
                ], // soft mint
              ),
              const SizedBox(height: 30),

              // Optional - message form
              _buildMessageForm(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required List<Color> gradient,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 26,
            backgroundColor: Colors.white.withOpacity(0.2),
            child: Icon(icon, color: Colors.white, size: 28),
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
                const SizedBox(height: 5),
                Text(subtitle,
                    style:
                        const TextStyle(fontSize: 14, color: Colors.white70)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageForm(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Send us a Message",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          decoration: InputDecoration(
            hintText: "Your Name",
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 179, 178, 178) // black in dark mode
                  : const Color.fromARGB(255, 43, 43, 43), // normal grey in light mode
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          decoration: InputDecoration(
            hintText: "Your Email",
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromARGB(255, 179, 178, 178) // black in dark mode
                  : const Color.fromARGB(255, 43, 43, 43),
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 14),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: "Your Message",
            hintStyle: TextStyle(
              color: Theme.of(context).brightness == Brightness.dark
               ? const Color.fromARGB(255, 179, 178, 178) // black in dark mode
                  : const Color.fromARGB(255, 43, 43, 43),
            ),
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF8EC5FC),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              "Send Message",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Back button + Title
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      "Privacy Policy",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                  const SizedBox(width: 48), // to balance arrow space
                ],
              ),
              const SizedBox(height: 24),

              // Gradient Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 163, 177, 248),
                      Color.fromARGB(255, 220, 181, 251)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  "We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we handle your data.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),

              // Sections
              _buildPolicySection(
                "1. Information We Collect",
                "We collect information you provide directly to us when creating an account, such as your name, email, and fitness activity data.",
              ),
              _buildPolicySection(
                "2. How We Use Your Data",
                "Your data is used to personalize your fitness journey, track progress, improve our services, and provide insights about your health and performance.",
              ),
              _buildPolicySection(
                "3. Data Sharing",
                "We do not sell or share your personal data with third parties, except as required by law or to provide essential services (like cloud storage).",
              ),
              _buildPolicySection(
                "4. Security",
                "We implement industry-standard security measures to protect your personal data from unauthorized access, alteration, or disclosure.",
              ),
              _buildPolicySection(
                "5. Your Rights",
                "You can access, update, or delete your personal data at any time by visiting your profile settings or contacting our support team.",
              ),

              const SizedBox(height: 24),

              // Contact Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: const Color(0xFF92A3FD),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Need Help?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "If you have any questions about this Privacy Policy, please contact us at:",
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      "support@fitnessapp.com",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6C63FF),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for sections
  Widget _buildPolicySection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6C63FF),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            content,
            style: const TextStyle(
                fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguageCode = 'en';

  final Map<String, Map<String, String>> localizedStrings = {
    'en': {
      'settings': 'Settings',
      'general_settings': 'General Settings',
      'preferences': 'Preferences',
      'appearance': 'Appearance',
      'app_version': 'App Version',
      'sign_out': 'Sign Out',
      'privacy_policy': 'Privacy Policy',
      'about_us': 'About Us',
      'contact_us': 'Contact Us',
      'notifications': 'Notifications',
      'language': 'Language',
      'workout_preferences': 'Workout Preferences',
      'goals_progress': 'Goals & Progress',
      'reminders': 'Reminders',
      'theme': 'Theme',
      'help_support': 'Help & Support',
    },
    'hi': {
      'settings': 'सेटिंग्स',
      'general_settings': 'सामान्य सेटिंग्स',
      'preferences': 'प्राथमिकताएँ',
      'appearance': 'दिखावट',
      'app_version': 'एप्लिकेशन संस्करण',
      'sign_out': 'साइन आउट',
      'privacy_policy': 'गोपनीयता नीति',
      'about_us': 'हमारे बारे में',
      'contact_us': 'संपर्क करें',
      'notifications': 'सूचनाएं',
      'language': 'भाषा',
      'workout_preferences': 'वर्कआउट प्राथमिकताएँ',
      'goals_progress': 'लक्ष्य और प्रगति',
      'reminders': 'स्मरणपत्र',
      'theme': 'थीम',
      'help_support': 'सहायता और समर्थन',
    },
    'ta': {
      'settings': 'அமைப்புகள்',
      'general_settings': 'பொது அமைப்புகள்',
      'preferences': 'விருப்பங்கள்',
      'appearance': 'வெளிப்பாடு',
      'app_version': 'ஆப் பதிப்பு',
      'sign_out': 'வெளியேறு',
      'privacy_policy': 'தனியுரிமை கொள்கை',
      'about_us': 'எங்களைப் பற்றி',
      'contact_us': 'தொடர்பு கொள்ளவும்',
      'notifications': 'அறிவிப்புகள்',
      'language': 'மொழி',
      'workout_preferences': 'பயிற்சி விருப்பங்கள்',
      'goals_progress': 'நோக்குகள் மற்றும் முன்னேற்றம்',
      'reminders': 'அறிவிப்புகள்',
      'theme': 'தீம்',
      'help_support': 'உதவி & ஆதரவு',
    },
    'ml': {
      'settings': 'സജ്ജീകരണങ്ങൾ',
      'general_settings': 'സാധാരണ സജ്ജീകരണങ്ങൾ',
      'preferences': 'ആഗ്രഹങ്ങൾ',
      'appearance': 'ദൃശ്യം',
      'app_version': 'ആപ്പ് പതിപ്പ്',
      'sign_out': 'സൈൻ ഔട്ട്',
      'privacy_policy': 'സ്വകാര്യത നയം',
      'about_us': 'ഞങ്ങളെക്കുറിച്ച്',
      'contact_us': 'ബന്ധപ്പെടുക',
      'notifications': 'അറിയിപ്പുകൾ',
      'language': 'ഭാഷ',
      'workout_preferences': 'വർക്ക്ഔട്ട് മുൻഗണനകൾ',
      'goals_progress': 'ലക്ഷ്യങ്ങളും പുരോഗതിയും',
      'reminders': 'സ്മരണകൾ',
      'theme': 'തീം',
      'help_support': 'സഹായം & പിന്തുണ',
    },
    'es': {
      'settings': 'Configuración',
      'general_settings': 'Configuración General',
      'preferences': 'Preferencias',
      'appearance': 'Apariencia',
      'app_version': 'Versión de la App',
      'sign_out': 'Cerrar sesión',
      'privacy_policy': 'Política de privacidad',
      'about_us': 'Sobre nosotros',
      'contact_us': 'Contáctanos',
      'notifications': 'Notificaciones',
      'language': 'Idioma',
      'workout_preferences': 'Preferencias de entrenamiento',
      'goals_progress': 'Metas y progreso',
      'reminders': 'Recordatorios',
      'theme': 'Tema',
      'help_support': 'Ayuda y soporte',
    },
    'de': {
      'settings': 'Einstellungen',
      'general_settings': 'Allgemeine Einstellungen',
      'preferences': 'Präferenzen',
      'appearance': 'Darstellung',
      'app_version': 'App-Version',
      'sign_out': 'Abmelden',
      'privacy_policy': 'Datenschutz-Bestimmungen',
      'about_us': 'Über uns',
      'contact_us': 'Kontaktieren Sie uns',
      'notifications': 'Benachrichtigungen',
      'language': 'Sprache',
      'workout_preferences': 'Trainingseinstellungen',
      'goals_progress': 'Ziele & Fortschritt',
      'reminders': 'Erinnerungen',
      'theme': 'Thema',
      'help_support': 'Hilfe & Unterstützung',
    },
    'fr': {
      'settings': 'Paramètres',
      'general_settings': 'Paramètres généraux',
      'preferences': 'Préférences',
      'appearance': 'Apparence',
      'app_version': 'Version de l\'app',
      'sign_out': 'Se déconnecter',
      'privacy_policy': 'Politique de confidentialité',
      'about_us': 'À propos de nous',
      'contact_us': 'Nous contacter',
      'notifications': 'Notifications',
      'language': 'Langue',
      'workout_preferences': 'Préférences d\'entraînement',
      'goals_progress': 'Objectifs et progression',
      'reminders': 'Rappels',
      'theme': 'Thème',
      'help_support': 'Aide & support',
    },
  };

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguageCode = prefs.getString('selected_language_code') ?? 'en';
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = selectedLanguageCode;
    final strings = localizedStrings[lang]!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back arrow + Heading
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        strings['settings']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 26),
                ],
              ),

              const SizedBox(height: 20),
              

              // Profile section...
                   Row(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: const Color(0xFF92A3FD),
                    child:
                        const Icon(Icons.person, size: 40, color: Colors.white),
                  ),

                  const SizedBox(width: 16),

                  // Name + Membership info
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Jeel",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Premium Member",
                        style: TextStyle(
                          fontSize: 14
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Sign Out button
                  Container(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10), // smaller height
                        minimumSize: Size.zero, // removes extra min constraints
                        tapTargetSize: MaterialTapTargetSize
                            .shrinkWrap, // prevents extra space
                      ),
                      onPressed: () {
                        // Handle sign out
                      },
                      child: const Text(
                        "Sign Out",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),


              // ===== General Settings =====
              _sectionTitle(strings['general_settings']!),
              _settingsCard([
                _buildSettingsTile(context, Icons.lock, strings['privacy_policy']!,
                    const PrivacyPolicyPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.info_outline, strings['about_us']!,
                    const AboutUsPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.contact_mail, strings['contact_us']!,
                    const ContactUsPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.notifications, strings['notifications']!,
                    const NotificationsPage()),
              ], context),

              const SizedBox(height: 30),

              // ===== Preferences =====
              _sectionTitle(strings['preferences']!),
              _settingsCard([
                _buildSettingsTile(context, Icons.language, strings['language']!,
                    LanguageSelectionPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.fitness_center,
                    strings['workout_preferences']!, const WorkoutPreferencesPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.track_changes,
                    strings['goals_progress']!, const GoalsProgressPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.alarm, strings['reminders']!,
                    const ReminderSettingsPage()),
              ], context),

              const SizedBox(height: 30),

              // ===== Appearance =====
              _sectionTitle(strings['appearance']!),
              _settingsCard([
                _buildSettingsTile(context, Icons.color_lens, strings['theme']!,
                    const ThemeSelectionPage()),
                _divider(context),
                _buildSettingsTile(context, Icons.help_outline, strings['help_support']!,
                    const HelpSupportPage()),
              ], context),

              const SizedBox(height: 40),

              // App Version Section
              Center(
                child: Column(
                  children: [
                    Text(strings['app_version']!),
                    const SizedBox(height: 4),
                    const Text(
                      "1.0.13",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF92A3FD),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  static Widget _settingsCard(List<Widget> children, context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  static Widget _buildSettingsTile(
      BuildContext context, IconData icon, String title, Widget destinationPage) {
    return ListTile(
      leading: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destinationPage),
        );
      },
    );
  }

  static Widget _divider(BuildContext context) {
    final Color dividerColor = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[300]!
        : const Color.fromARGB(255, 179, 179, 179);

    return Divider(
      height: 1,
      thickness: 0.5,
      color: dividerColor,
      indent: 16,
      endIndent: 16,
    );
  }
   }

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  body: SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row with back button and centered title
          Row(
            children: [
              // Back arrow button
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "About Us",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              // Empty space to balance the row
              const SizedBox(width: 48),
            ],
          ),
          const SizedBox(height: 20),

          // Page Content
          const Text(
            "Welcome to our app! \n\n"
            "We are passionate about creating beautiful and interactive user interfaces. "
            "Our goal is to provide a seamless experience while exploring new technologies like Flutter, React, and Firebase. "
            "We constantly strive to innovate and bring the best experience to our users.",
            style: TextStyle(
              fontSize: 16, // you can also use Theme.of(context).textTheme.bodyMedium?.color
            ),
          ),
        ],
      ),
    ),
  ),
);


  }
}


class LanguageSelectionPage extends StatefulWidget {
  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguageCode = 'en'; // Default language code

  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en'},
    {'name': 'Spanish', 'code': 'es'},
    {'name': 'French', 'code': 'fr'},
    {'name': 'German', 'code': 'de'},
    {'name': 'Hindi', 'code': 'hi'},
    {'name': 'Tamil', 'code': 'ta'},
    {'name': 'Malayalam', 'code': 'ml'},
  ];

  final Map<String, Map<String, dynamic>> localizedStrings = {
    'en': {
      'app_bar_title': 'Select Language',
      'choose_language': 'Choose Your Language',
      'language_names': {
        'en': 'English',
        'es': 'Spanish',
        'fr': 'French',
        'de': 'German',
        'hi': 'Hindi',
        'ta': 'Tamil',
        'ml': 'Malayalam',
      },
    },
    'hi': {
      'app_bar_title': 'भाषा चुनें',
      'choose_language': 'अपनी भाषा चुनें',
      'language_names': {
        'en': 'अंग्रेज़ी',
        'es': 'स्पेनिश',
        'fr': 'फ्रेंच',
        'de': 'जर्मन',
        'hi': 'हिन्दी',
        'ta': 'तमिल',
        'ml': 'मलयालम',
      },
    },
    'ta': {
      'app_bar_title': 'மொழியை தேர்வு செய்க',
      'choose_language': 'உங்கள் மொழியை தேர்ந்தெடுக்கவும்',
      'language_names': {
        'en': 'ஆங்கிலம்',
        'es': 'ஸ்பானிஷ்',
        'fr': 'பிரஞ்சு',
        'de': 'ஜெர்மன்',
        'hi': 'ஹிந்தி',
        'ta': 'தமிழ்',
        'ml': 'மலையாளம்',
      },
    },
    'ml': {
      'app_bar_title': 'ഭാഷ തിരഞ്ഞെടുക്കുക',
      'choose_language': 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക',
      'language_names': {
        'en': 'ഇംഗ്ലീഷ്',
        'es': 'സ്പാനിഷ്',
        'fr': 'ഫ്രഞ്ച്',
        'de': 'ജർമ്മൻ',
        'hi': 'ഹിന്ദി',
        'ta': 'തമിഴ്',
        'ml': 'മലയാളം',
      },
    },
    'es': {
      'app_bar_title': 'Seleccionar idioma',
      'choose_language': 'Elige tu idioma',
      'language_names': {
        'en': 'Inglés',
        'es': 'Español',
        'fr': 'Francés',
        'de': 'Alemán',
        'hi': 'Hindi',
        'ta': 'Tamil',
        'ml': 'Malayalam',
      },
    },
    'de': {
      'app_bar_title': 'Sprache auswählen',
      'choose_language': 'Wählen Sie Ihre Sprache',
      'language_names': {
        'en': 'Englisch',
        'es': 'Spanisch',
        'fr': 'Französisch',
        'de': 'Deutsch',
        'hi': 'Hindi',
        'ta': 'Tamil',
        'ml': 'Malayalam',
      },
    },
    'fr': {
      'app_bar_title': 'Sélectionner la langue',
      'choose_language': 'Choisissez votre langue',
      'language_names': {
        'en': 'Anglais',
        'es': 'Espagnol',
        'fr': 'Français',
        'de': 'Allemand',
        'hi': 'Hindi',
        'ta': 'Tamoul',
        'ml': 'Malayalam',
      },
    },
  };

  @override
  void initState() {
    super.initState();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedLanguageCode = prefs.getString('selected_language_code') ?? 'en';
    });
  }

  Future<void> _saveSelectedLanguage(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_language_code', code);
  }

  @override
  Widget build(BuildContext context) {
    final lang = selectedLanguageCode;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          localizedStrings[lang]?['app_bar_title'] ?? 'Select Language',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                localizedStrings[lang]?['choose_language'] ?? 'Choose Your Language',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final language = languages[index];
                    final isSelected = language['code'] == selectedLanguageCode;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguageCode = language['code']!;
                          _saveSelectedLanguage(selectedLanguageCode);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? const LinearGradient(
                                  colors: [
                                    Color(0xFF92A3FD),
                                    Color(0xFF9DCEFF),
                                    Color(0xFF8E54E9),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )
                              : const LinearGradient(
                                  colors: [
                                    Color(0xFFF3F3F3),
                                    Color.fromARGB(255, 238, 237, 237),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: isSelected
                              ? [
                                  const BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  )
                                ]
                              : [],
                        ),
                        child: Text(
                          localizedStrings[lang]?['language_names'][language['code']] ?? language['name']!,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkoutPreferencesPage extends StatefulWidget {
  const WorkoutPreferencesPage({super.key});

  @override
  State<WorkoutPreferencesPage> createState() => _WorkoutPreferencesPageState();
}

class _WorkoutPreferencesPageState extends State<WorkoutPreferencesPage> {
  final List<String> workoutOptions = [
    'Cardio',
    'Strength',
    'Yoga',
    'Pilates',
    'HIIT',
    'CrossFit',
  ];

  List<String> selectedWorkouts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back arrow and title row
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Workout Preferences",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Select Your Workouts",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Workout list
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: workoutOptions.length,
              itemBuilder: (context, index) {
                final workout = workoutOptions[index];
                final isSelected = selectedWorkouts.contains(workout);

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedWorkouts.remove(workout);
                      } else {
                        selectedWorkouts.add(workout);
                      }
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      gradient: isSelected
                          ? const LinearGradient(
                              colors: [
                                Color(0xFF92A3FD),
                                Color(0xFF9DCEFF),
                                Color(0xFF8E54E9),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            )
                          : const LinearGradient(
                              colors: [
                                Color(0xFFF3F3F3),
                                Color(0xFFEAEAEA),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: isSelected
                          ? const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              )
                            ]
                          : [],
                    ),
                    child: Text(
                      workout,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.w500,
                        color: isSelected ? Colors.white : Colors.black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ),
  ),
);

  }
}

class GoalsProgressPage extends StatelessWidget {
  const GoalsProgressPage({super.key});

  final List<Map<String, dynamic>> goals = const [
    {"title": "Daily Steps", "progress": 0.6},
    {"title": "Workout Sessions", "progress": 0.4},
    {"title": "Calories Burned", "progress": 0.7},
    {"title": "Water Intake", "progress": 0.5},
    {"title": "Meditation", "progress": 0.8},
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with back button and centered title
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Goals & Progress",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
            const SizedBox(height: 20),

            // Page heading
            const Text(
              "Your Goals",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),

            // Goals list
            ...goals.map((goal) {
              final progress = goal["progress"] as double;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF92A3FD),
                      Color(0xFF9DCEFF),
                      Color(0xFF8E54E9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal["title"],
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: progress,
                        minHeight: 10,
                        backgroundColor: Colors.white24,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${(progress * 100).toInt()}% Completed",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    ),
  ),
);

  }
}

class ReminderSettingsPage extends StatefulWidget {
  const ReminderSettingsPage({super.key});

  @override
  State<ReminderSettingsPage> createState() => _ReminderSettingsPageState();
}

class _ReminderSettingsPageState extends State<ReminderSettingsPage> {
  // Example reminders
  Map<String, bool> reminders = {
    "Workout": true,
    "Drink Water": false,
    "Meditation": true,
    "Sleep Schedule": false,
  };

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: Theme.of(context).scaffoldBackgroundColor, // White background
  body: SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with back button and centered title
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new),
                  
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      "Reminders",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
            const SizedBox(height: 20),

            // Page heading
            const Text(
              "Your Reminders",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20),

            // Reminders list
            ...reminders.keys.map((key) {
              final isEnabled = reminders[key]!;

              return Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                decoration: BoxDecoration(
                  gradient: isEnabled
                      ? const LinearGradient(
                          colors: [
                            Color(0xFF92A3FD),
                            Color(0xFF9DCEFF),
                            Color(0xFF8E54E9),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : const LinearGradient(
                          colors: [
                            Color(0xFFF3F3F3),
                            Color(0xFFEAEAEA),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: isEnabled
                      ? const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          )
                        ]
                      : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      key,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isEnabled ? Colors.white : Colors.black87,
                      ),
                    ),
                    Switch(
                      value: isEnabled,
                      activeColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          reminders[key] = value;
                        });
                      },
                    )
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    ),
  ),
);

  }
}

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> helpOptions = [
      {"title": "FAQs", "icon": Icons.question_answer},
      {"title": "Contact Support", "icon": Icons.contact_support},
      {"title": "Feedback", "icon": Icons.feedback},
    ];

    return Scaffold(
       backgroundColor:Theme.of(context).scaffoldBackgroundColor, // ✅ White background
      appBar: AppBar(
        title: const Text(
          "Help & Support",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor:Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "How can we help you?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold // ✅ Black text now
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: helpOptions.length,
                  itemBuilder: (context, index) {
                    final option = helpOptions[index];
                    return GestureDetector(
                      onTap: () {
                        // TODO: Add navigation or action for each option
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF92A3FD), // blue
                              Color(0xFF9DCEFF), // lavender
                              Color(0xFF8E54E9), // violet
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              option["icon"],
                              color: const Color.fromARGB(255, 255, 248, 248),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              option["title"],
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 253, 253),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

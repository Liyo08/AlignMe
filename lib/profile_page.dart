import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'main.dart';
import 'package:fl_chart/fl_chart.dart';
// For persisting selected language
import 'settingspage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedLanguageCode = 'en';

  final Map<String, Map<String, String>> localizedStrings = {
  'en': {
    'profile': 'Profile',
    'personal_data': 'Personal Data',
    'achievement': 'Achievement',
    'activity_history': 'Activity History',
    'workout_progress': 'Workout Progress',
    'contact_us': 'Contact Us',
    'privacy_policy': 'Privacy Policy',
    'settings': 'Settings',
    'edit': 'Edit',
    'notification': 'Notification',
    'other': 'Other',
    'pop_up_notification': 'Pop-up Notification',
  },
  'hi': {
    'profile': 'प्रोफ़ाइल',
    'personal_data': 'व्यक्तिगत डेटा',
    'achievement': 'उपलब्धि',
    'activity_history': 'गतिविधि इतिहास',
    'workout_progress': 'व्यायाम प्रगति',
    'contact_us': 'संपर्क करें',
    'privacy_policy': 'गोपनीयता नीति',
    'settings': 'सेटिंग्स',
    'edit': 'संपादित करें',
    'notification': 'सूचनाएँ',
    'other': 'अन्य',
    'pop_up_notification': 'पॉप-अप सूचना',
  },
  'es': {
    'profile': 'Perfil',
    'personal_data': 'Datos Personales',
    'achievement': 'Logros',
    'activity_history': 'Historial de Actividades',
    'workout_progress': 'Progreso del Entrenamiento',
    'contact_us': 'Contáctanos',
    'privacy_policy': 'Política de Privacidad',
    'settings': 'Configuraciones',
    'edit': 'Editar',
    'notification': 'Notificación',
    'other': 'Otro',
    'pop_up_notification': 'Notificación emergente',
  },
  'fr': {
    'profile': 'Profil',
    'personal_data': 'Données Personnelles',
    'achievement': 'Réalisations',
    'activity_history': 'Historique des Activités',
    'workout_progress': 'Progression de l’Entraînement',
    'contact_us': 'Contactez-nous',
    'privacy_policy': 'Politique de Confidentialité',
    'settings': 'Paramètres',
    'edit': 'Modifier',
    'notification': 'Notification',
    'other': 'Autre',
    'pop_up_notification': 'Notification contextuelle',
  },
  'de': {
    'profile': 'Profil',
    'personal_data': 'Persönliche Daten',
    'achievement': 'Erfolge',
    'activity_history': 'Aktivitätsverlauf',
    'workout_progress': 'Trainingsfortschritt',
    'contact_us': 'Kontaktieren Sie uns',
    'privacy_policy': 'Datenschutzrichtlinie',
    'settings': 'Einstellungen',
    'edit': 'Bearbeiten',
    'notification': 'Benachrichtigung',
    'other': 'Andere',
    'pop_up_notification': 'Pop-up-Benachrichtigung',
  },
  'ta': {
    'profile': 'சுயவிவரம்',
    'personal_data': 'தனிப்பட்ட தகவல்கள்',
    'achievement': 'சாதனைகள்',
    'activity_history': 'செயல்பாட்டு வரலாறு',
    'workout_progress': 'பயிற்சி முன்னேற்றம்',
    'contact_us': 'தொடர்பு கொள்ள',
    'privacy_policy': 'தனியுரிமை கொள்கை',
    'settings': 'அமைப்புகள்',
    'edit': 'மாற்று',
    'notification': 'அறிவிப்புகள்',
    'other': 'மற்றவை',
    'pop_up_notification': 'பாப்-அப் அறிவிப்பு',
  },
  'ml': {
    'profile': 'പ്രൊഫൈൽ',
    'personal_data': 'വ്യക്തിഗത വിവരങ്ങൾ',
    'achievement': 'സാദ്ധ്യതകൾ',
    'activity_history': 'പ്രവൃത്തി ചരിത്രം',
    'workout_progress': 'അഭ്യാസ പുരോഗതി',
    'contact_us': 'ഞങ്ങളെ ബന്ധപ്പെടുക',
    'privacy_policy': 'ഗോപനീയത നയം',
    'settings': 'സജ്ജീകരണങ്ങൾ',
    'edit': 'എഡിറ്റ്',
    'notification': 'അറിയിപ്പുകൾ',
    'other': 'മറ്റ്',
    'pop_up_notification': 'പോപ്പ്-അപ്പ് അറിയിപ്പ്',
  },
};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadSelectedLanguage();
  }

  Future<void> _loadSelectedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String code = prefs.getString('selected_language_code') ?? 'en';
    setState(() {
      selectedLanguageCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    final lang = selectedLanguageCode;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      if (Navigator.of(context).canPop()) {
                        Navigator.of(context).pop();
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CustomBottomNavBar()),
                        );
                      }
                    },
                  ),
                  Text(
                    localizedStrings[lang]?['profile'] ?? 'Profile',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  IconButton(
                    icon: const Icon(Icons.refresh, size: 28),
                    onPressed: () async {
                      await Future.delayed(const Duration(seconds: 1));
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String code =
                          prefs.getString('selected_language_code') ?? 'en';
                      setState(() {
                        selectedLanguageCode = code;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Profile Header
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
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
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
                        child:  Text(
    localizedStrings[lang]?['edit'] ?? 'Edit', // 🔹 localized
    style: const TextStyle(color: Colors.white),
  ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),

              // Stats Row
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
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

              // Account Section
              _buildSection(
                title: localizedStrings[lang]?['profile'] ?? 'Account',
                items: [
                  _buildListTile(
                      Icons.person_outline,
                      localizedStrings[lang]?['personal_data'] ??
                          'Personal Data',
                      const PersonalDataPage(),
                      context),
                  _divider(context),
                  _buildListTile(
                      Icons.emoji_events_outlined,
                      localizedStrings[lang]?['achievement'] ?? 'Achievement',
                      const AchievementPage(),
                      context),
                  _divider(context),
                  _buildListTile(
                      Icons.history,
                      localizedStrings[lang]?['activity_history'] ??
                          'Activity History',
                      const ActivityHistoryPage(),
                      context),
                  _divider(context),
                  _buildListTile(
                      Icons.fitness_center,
                      localizedStrings[lang]?['workout_progress'] ??
                          'Workout Progress',
                      const WorkoutProgressPage(),
                      context),
                ],
                context: context,
              ),

              // Notification Section (unchanged)
              _buildSection(
                title: localizedStrings[lang]?['notification'] ?? 'Notification', // 🔹 localized
                items: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Row(
                        children: [
                          Icon(Icons.notifications_outlined,
                              color: Color.fromARGB(255, 207, 138, 219)),
                          SizedBox(width: 8),
                          Text(
                            localizedStrings[lang]?['pop_up_notification'] ?? 'Pop-up Notification', // 🔹 localized
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
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
                          padding: const EdgeInsets.all(2),
                          child: FlutterSwitch(
                            width: 50,
                            height: 20,
                            toggleSize: 26,
                            value: true,
                            borderRadius: 30.0,
                            padding: 2.0,
                            activeColor: Colors.transparent,
                            inactiveColor: Colors.grey.shade300,
                            activeToggleColor: Colors.white,
                            inactiveToggleColor: Colors.white,
                            showOnOff: false,
                            onToggle: (val) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                context: context,
              ),

              // Other Section
              _buildSection(
               title: localizedStrings[lang]?['other'] ?? 'Other', // 🔹 localized
                items: [
                  _buildListTile(
                      Icons.mail_outline,
                      localizedStrings[lang]?['contact_us'] ?? 'Contact Us',
                      const ContactUsPage(),
                      context),
                  _divider(context),
                  _buildListTile(
                      Icons.privacy_tip_outlined,
                      localizedStrings[lang]?['privacy_policy'] ??
                          'Privacy Policy',
                      const PrivacyPolicyPage(),
                      context),
                  _divider(context),
                  _buildListTile(
                      Icons.settings_outlined,
                      localizedStrings[lang]?['settings'] ?? 'Settings',
                      const SettingsPage(),
                      context),
                ],
                context: context,
              ),
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
        : const Color.fromARGB(
            255, 179, 179, 179); // dark grey/black-grey for light mode

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
                  ? const Color.fromARGB(
                      255, 179, 178, 178) // black in dark mode
                  : const Color.fromARGB(
                      255, 43, 43, 43), // normal grey in light mode
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
                  ? const Color.fromARGB(
                      255, 179, 178, 178) // black in dark mode
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
                  ? const Color.fromARGB(
                      255, 179, 178, 178) // black in dark mode
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
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
            style: const TextStyle(fontSize: 14, height: 1.5),
          ),
        ],
      ),
    );
  }
}

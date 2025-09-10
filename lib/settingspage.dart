import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'notification_page.dart';
import 'themeselection_page.dart';

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
    // ... [your localizedStrings map stays unchanged] ...
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

  Future<void> _refreshPage() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    await _loadSelectedLanguage();
  }

  @override
  Widget build(BuildContext context) {
    final lang = selectedLanguageCode;
    final strings = localizedStrings[lang]!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: Colors.transparent,
          backgroundColor: Colors.transparent,
          onRefresh: _refreshPage,
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(20),
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
                      const SizedBox(width: 26),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Profile section...
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundColor: const Color(0xFF92A3FD),
                        child: const Icon(Icons.person, size: 40, color: Colors.white),
                      ),
                      const SizedBox(width: 16),
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
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                      const Spacer(),
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
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () {},
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

                  // General Settings Section
                  _sectionTitle(strings['general_settings']!),
                  _settingsCard([
                    _buildSettingsTile(context, Icons.lock, strings['privacy_policy']!, const PrivacyPolicyPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.info_outline, strings['about_us']!, const AboutUsPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.contact_mail, strings['contact_us']!, const ContactUsPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.notifications, strings['notifications']!, const NotificationsPage()),
                  ], context),

                  const SizedBox(height: 30),

                  // Preferences Section
                  _sectionTitle(strings['preferences']!),
                  _settingsCard([
                    _buildSettingsTile(context, Icons.language, strings['language']!, LanguageSelectionPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.fitness_center, strings['workout_preferences']!, const WorkoutPreferencesPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.track_changes, strings['goals_progress']!, const GoalsProgressPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.alarm, strings['reminders']!, const ReminderSettingsPage()),
                  ], context),

                  const SizedBox(height: 30),

                  // Appearance Section
                  _sectionTitle(strings['appearance']!),
                  _settingsCard([
                    _buildSettingsTile(context, Icons.color_lens, strings['theme']!, const ThemeSelectionPage()),
                    _divider(context),
                    _buildSettingsTile(context, Icons.help_outline, strings['help_support']!, const HelpSupportPage()),
                  ], context),

                  const SizedBox(height: 40),

                  // App Version Section
                  Center(
                    child: Column(
                      children: [
                        Text(strings['app_version']!),
                        const SizedBox(height: 4),
                        const Text(
                          "1.0.15",
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
              // Animated Gradient while pulling
              
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

  static Widget _buildSettingsTile(BuildContext context, IconData icon, String title, Widget destinationPage) {
    return ListTile(
      leading: ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Icon(icon, color: Colors.white),
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

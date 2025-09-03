import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';


class ThemeSelectionPage extends StatefulWidget {
  const ThemeSelectionPage({super.key});

  @override
  State<ThemeSelectionPage> createState() => _ThemeSelectionPageState();
}

class _ThemeSelectionPageState extends State<ThemeSelectionPage> {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final selectedTheme = appTheme.themeMode;

    return Scaffold(
      backgroundColor:Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Choose Theme",
          style: TextStyle(),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              _buildThemeOption("Light Theme", ThemeMode.light, selectedTheme, appTheme),
              _buildThemeOption("Dark Theme", ThemeMode.dark, selectedTheme, appTheme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeOption(
      String title, ThemeMode mode, ThemeMode selectedTheme, AppTheme appTheme) {
    final isSelected = selectedTheme == mode;

    return GestureDetector(
      onTap: () => appTheme.setTheme(mode), // ✅ updates theme globally
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFF92A3FD), Color(0xFF9DCEFF), Color(0xFF8E54E9)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFFF3F3F3), Color(0xFFEAEAEA)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected
              ? const [BoxShadow(color: Colors.black26, blurRadius: 8, offset: Offset(0, 4))]
              : [],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            Radio<ThemeMode>(
              value: mode,
              groupValue: selectedTheme,
              activeColor: Colors.white,
              onChanged: (ThemeMode? value) {
                if (value != null) appTheme.setTheme(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

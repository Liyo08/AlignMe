import 'package:flutter/material.dart';

class ThemeSelectionPage extends StatefulWidget {
  final Function(ThemeMode) onThemeChanged;
  const ThemeSelectionPage({super.key, required this.onThemeChanged});

  @override
  State<ThemeSelectionPage> createState() => _ThemeSelectionPageState();
}

class _ThemeSelectionPageState extends State<ThemeSelectionPage> {
  ThemeMode selectedTheme = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF92A3FD), // blue
              Color(0xFF9DCEFF), // light lavender
              Color(0xFF8E54E9), // violet
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Choose Theme",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RadioListTile<ThemeMode>(
                title: const Text("Light Theme", style: TextStyle(color: Colors.white)),
                value: ThemeMode.light,
                groupValue: selectedTheme,
                onChanged: (ThemeMode? value) {
                  setState(() {
                    selectedTheme = value!;
                  });
                  widget.onThemeChanged(selectedTheme);
                },
              ),
              RadioListTile<ThemeMode>(
                title: const Text("Dark Theme", style: TextStyle(color: Colors.white)),
                value: ThemeMode.dark,
                groupValue: selectedTheme,
                onChanged: (ThemeMode? value) {
                  setState(() {
                    selectedTheme = value!;
                  });
                  widget.onThemeChanged(selectedTheme);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
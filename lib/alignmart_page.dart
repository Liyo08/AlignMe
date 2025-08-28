import 'package:flutter/material.dart';

class AlignMartPage extends StatelessWidget {
  const AlignMartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AlignMart")),
      body: const Center(
        child: Text("Welcome to AlignMart Store! 🛒"),
      ),
    );
  }
}

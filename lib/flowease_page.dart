import 'package:flutter/material.dart';
class FlowEasePage extends StatelessWidget {
  const FlowEasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FlowEase")),
      body: const Center(
        child: Text("Welcome to FlowEase Page!"),
      ),
    );
  }
}
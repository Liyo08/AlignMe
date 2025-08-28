import 'package:flutter/material.dart';

class FullBody extends StatelessWidget {
  const FullBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Full Body Workout"),
        backgroundColor: const Color(0xFF92A3FD),
      ),
      body: const Center(
        child: Text(
          "This is the Full Body Workout Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

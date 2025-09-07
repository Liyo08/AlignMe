import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  double? bmiResult;
  String bmiCategory = "";
  Color categoryColor = Colors.black54;
  bool showResult = false;

  void calculateBMI() {
    final double? height = double.tryParse(heightController.text);
    final double? weight = double.tryParse(weightController.text);

    if (height != null && weight != null && height > 0) {
      final double bmi = weight / ((height / 100) * (height / 100));

      setState(() {
        bmiResult = bmi;
        showResult = true;

        if (bmi < 18.5) {
          bmiCategory = "Underweight";
          categoryColor = Colors.orange;
        } else if (bmi < 24.9) {
          bmiCategory = "Normal";
          categoryColor = Colors.green;
        } else if (bmi < 29.9) {
          bmiCategory = "Overweight";
          categoryColor = Colors.deepOrange;
        } else {
          bmiCategory = "Obese";
          categoryColor = Colors.red;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A90E2),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);  // Back to previous screen
          },
        ),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF7EB6FF), Color(0xFF4A90E2)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),  // Space below AppBar

                  Card(
                    elevation: 12,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            controller: heightController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Height (cm)",
                              prefixIcon: Icon(Icons.straighten),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: weightController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: "Weight (kg)",
                              prefixIcon: Icon(Icons.monitor_weight),
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton.icon(
                    onPressed: calculateBMI,
                    icon: const Icon(Icons.calculate),
                    label: const Text(
                      "Calculate BMI",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF4A90E2),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  AnimatedOpacity(
                    opacity: showResult ? 1 : 0,
                    duration: const Duration(milliseconds: 800),
                    child: bmiResult != null
                        ? Container(
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Your BMI",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  bmiResult!.toStringAsFixed(1),
                                  style: TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: categoryColor,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  bmiCategory,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: categoryColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

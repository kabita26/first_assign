import 'package:flutter/material.dart';

class Arithmetic extends StatefulWidget {
  const Arithmetic({super.key});

  @override
  State<Arithmetic> createState() => _ArithmeticState();
}

class _ArithmeticState extends State<Arithmetic> {
  // Controllers for the text fields
  final TextEditingController firstController = TextEditingController();
  final TextEditingController secondController = TextEditingController();

  int result = 0; // Result variable
  final GlobalKey<FormState> myKey = GlobalKey<FormState>(); // Form key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic View'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              // First Number Input
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter First Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the first number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Second Number Input
              TextFormField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Second Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the second number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Display Result
              Text(
                'Result: $result',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 20),

              // Addition Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        int first = int.parse(firstController.text);
                        int second = int.parse(secondController.text);
                        result = first + second;
                      });
                    }
                  },
                  child: const Text('Addition'),
                ),
              ),
              const SizedBox(height: 10),

              // Subtraction Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        int first = int.parse(firstController.text);
                        int second = int.parse(secondController.text);
                        result = first - second;
                      });
                    }
                  },
                  child: const Text('Subtraction'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SimpleInterest extends StatefulWidget {
  const SimpleInterest({super.key});

  @override
  State<SimpleInterest> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<SimpleInterest> {
  final firstController = TextEditingController(text: '30');
  final secondController = TextEditingController(text: '30');
  final thirdController = TextEditingController(text: '30');
  double result = 0;

  //Global key for form state
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: myKey,
          child: Column(
            children: [
              TextFormField(
                // onChanged: (value) {
                //   first = int.tryParse(value) ?? 0;
                // },
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter principle",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter principle";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter time",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter time";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: thirdController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter rate",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter rate";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Text(
                "Result: $result",
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Page lai refresh garako
                    if (myKey.currentState!.validate()) {
                      setState(() {
                        result = (double.parse(firstController.text) *
                            double.parse(firstController.text) *
                            double.parse(thirdController.text) *
                            100);
                      });
                    }
                  },
                  child: const Text('Simple Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
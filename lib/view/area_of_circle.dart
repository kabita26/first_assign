import 'package:flutter/material.dart';

class AreaOfCircleView extends StatefulWidget {
  const AreaOfCircleView({super.key});

  @override
  State<AreaOfCircleView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<AreaOfCircleView> {
  final firstController = TextEditingController(text: '30');
  double result = 0;

  //Global key for form state
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
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
                  labelText: "Enter radius",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter radius";
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
                        result = double.parse(firstController.text) *
                            double.parse(firstController.text) * 3.14;
                      });
                    }
                  },
                  child: const Text('Area of Circle'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
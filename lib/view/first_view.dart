import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('first app'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const Text('hellow nepal'),
    );
  }
}
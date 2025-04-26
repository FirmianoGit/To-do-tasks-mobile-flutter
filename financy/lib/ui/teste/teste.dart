import 'package:flutter/material.dart';


class RedScreen extends StatelessWidget {
  const RedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Text(
          'Red Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class GreenScreen extends StatelessWidget {
  const GreenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'green Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class BlueScreen extends StatelessWidget {
  const BlueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text(
          'blue Screen',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Subscribe extends StatefulWidget {
  const Subscribe({super.key});

  @override
  State<Subscribe> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Subscribe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('subscribe now'),
      ),
    );
  }
}

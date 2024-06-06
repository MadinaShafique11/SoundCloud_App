import 'package:flutter/material.dart';

class Activity extends StatefulWidget {
  const Activity({super.key});

  @override
  State<Activity> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Activity page'),
      ),
    );
  }
}

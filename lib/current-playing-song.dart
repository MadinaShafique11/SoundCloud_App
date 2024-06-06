import 'package:flutter/material.dart';

class CurrentSong extends StatefulWidget {
  const CurrentSong({super.key});

  @override
  State<CurrentSong> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CurrentSong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Current playing song'),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Upgarde extends StatefulWidget {
  const Upgarde({super.key});

  @override
  State<Upgarde> createState() => _UpgardeState();
}

class _UpgardeState extends State<Upgarde> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upgarde page'),
      ),
      body: Center(
        child: Text('Upgarde page '),
      ),
    );
  }
}

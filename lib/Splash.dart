import 'package:flutter/material.dart';
import 'package:soundcloud/firstpage.dart';
import 'package:soundcloud/registration.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome(); // comment this to work on splash
  }

  _navigatetohome() async {
    await Future.delayed(Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => Registertion(title: 'Home')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            child: Image.asset(
              'images/logo2.jpg',
              width: 150,
              height: 150,
            ),
          ),
        ));
  }
}

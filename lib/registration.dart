import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundcloud/signuppage.dart';
import 'package:soundcloud/singinpage.dart';

class Registertion extends StatefulWidget {
  const Registertion({super.key, required this.title});
  final String title;

  @override
  State<Registertion> createState() => _RegistertionState();
}

class _RegistertionState extends State<Registertion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/registerImage.jpg'), fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            SizedBox(
                height: 150,
                width: 150,
                child: Image.asset(
                  'images/logo.png',
                  color: Colors.white,
                )),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Find music you love.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: const Text(
                'Discover new artists.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    minimumSize: Size(MediaQuery.of(context).size.width, 40)),
                child: const Text(
                  'Create an account',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => SignUp()));
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(MediaQuery.of(context).size.width, 40)),
              child: const Text(
                'I already have an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  //fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

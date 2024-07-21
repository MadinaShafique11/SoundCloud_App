import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soundcloud/firstpage.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10, left: 10),
            margin: EdgeInsets.only(right: 10, left: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Sign in or create an \n account',
              //textAlign: TextAlign.right,
              //textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          // ignore: unnecessary_const
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            width: 400,
            child: FilledButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'images/facebook.png',
                width: 20,
                height: 20,
                color: Colors.white,
              ),
              style: FilledButton.styleFrom(
                  //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              label: const Text(
                'Continous with Facebook',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          Container(
            width: 400,
            margin: EdgeInsets.only(bottom: 5, left: 10, right: 10),
            child: FilledButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'images/google.png',
                  height: 20,
                  width: 20,
                  //color: Colors.white,
                ),
                style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 233, 228, 228),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                label: const Text(
                  'Contious With Google',
                  style: TextStyle(color: Colors.black),
                )),
          ),
          Container(
            width: 400,
            margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: FilledButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'images/apple.png',
                  color: Colors.white,
                  height: 20,
                  width: 20,
                ),
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                label: const Text(
                  'Continous with Apple',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Or with email',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 400,
            height: 45,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 233, 228, 228),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: "Your email address",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 119, 116, 116)),
                  border: InputBorder.none),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstPage(
                                title: 'home',
                              )));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  minimumSize: Size(500, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                child: const Text(
                  'Continous',
                  style: TextStyle(color: Colors.white),
                )),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Need help?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 47, 133, 190),
                  ),
                )),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 15, right: 10, top: 10),
              child: RichText(
                text: const TextSpan(
                    style: TextStyle(
                        color: Color.fromARGB(255, 119, 116, 116),
                        fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "When registering, you agree that we may use your provided data for the registration and to send you notifications on our products and services. You can unsubscribe from notifications at any time in your settings. For additional info please refer to our"),
                      TextSpan(
                          text: " Privacy Policy.",
                          style: TextStyle(
                              color: Color.fromARGB(255, 47, 133, 190)))
                    ]),
              ))
        ],
      ),
    ));
  }
}

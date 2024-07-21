import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundcloud/Splash.dart';
import 'package:soundcloud/likesong.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => lovesong(),
      builder: (context, child) => const MaterialApp(
          //title: 'Sound cloud',
          debugShowCheckedModeBanner: false,
          home: splash()),
    );

    // MaterialApp(
    //   title: 'Sound cloud',
    //   debugShowCheckedModeBanner: true,
    //   // theme: ThemeData(
    //   //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //   //   useMaterial3: true,
    //   // ),
    //   home: const splash(),
    //   //home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

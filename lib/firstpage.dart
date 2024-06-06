import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:soundcloud/activities.dart';
import 'package:soundcloud/current-playing-song.dart';
import 'package:soundcloud/feeds.dart';
import 'package:soundcloud/home.dart';
import 'package:soundcloud/library.dart';
import 'package:soundcloud/search.dart';
import 'package:soundcloud/subscribe.dart';
import 'package:soundcloud/upgrade.dart';
import 'package:soundcloud/upload.dart';
//import 'package:soundcloud/square.dart';

class FirstPage extends StatefulWidget {
  FirstPage({super.key, required this.title});

  final String title;

  @override
  State<FirstPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstPage> {
  var _myIndex = 0;
  List<Widget> _pages = const [
    Home(),
    Feeds(),
    Search(),
    Library(),
    Upgarde(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 29, 29, 28).withOpacity(1.0),
            foregroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 29.0,
                  padding: EdgeInsets.all(0),
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(239, 192, 42, 92),
                    Color.fromARGB(255, 231, 69, 28)
                  ])),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Subscribe()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent),
                      child: const Text(
                        'Get Next Pro',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      )),
                ),
                const Text('          '),
                Text(widget.title, textAlign: TextAlign.right),
              ],
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Upload()));
                  },
                  icon: const ImageIcon(AssetImage('lib/icons/upload.png'))),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Activity()));
                  },
                  icon: const ImageIcon(AssetImage('lib/icons/Activity.png'))),
            ],
          ),
          //// main body
          body: _pages[_myIndex],
          floatingActionButton: Container(
            height: 70,
            width: 385,
            //padding: EdgeInsets.all(5),
            //margin: EdgeInsets.all(5),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(80)),
            ),
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CurrentSong()));
                },
                tooltip: 'Increment',
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(42)),
                foregroundColor: Colors.white,
                backgroundColor:
                    Color.fromARGB(255, 29, 29, 28).withOpacity(0.8),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.play_circle),
                    Text('Anti-Hero Anti-Hero Anti-Hero'),
                    Text('Taylor Swift'),
                    Icon(Icons.cast),
                    Icon(Icons.favorite_border),
                  ],
                )),
          ),
          //=======================================
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Color.fromARGB(255, 41, 40, 40),
            selectedItemColor: Color.fromARGB(232, 240, 32, 4),
            unselectedItemColor: Colors.white,
            onTap: (Index) {
              setState(() {
                _myIndex = Index;
              });
            },
            currentIndex: _myIndex,
            items: const [
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage(
                    'lib/icons/home.png',
                  ),
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('lib/icons/feed.png')),
                label: 'Feed',
              ),
              BottomNavigationBarItem(
                //icon: Icon(Icons.search),
                icon: ImageIcon(AssetImage('lib/icons/search.png')),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('lib/icons/library.png')),
                label: 'library',
              ),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage('lib/icons/upgrade.png')),
                  label: 'Updrade'),
              //BottomNavigationBarItem(icon: Icon(Icons.abc), label: 'temp'),
            ],
          )),
    );
  }
}

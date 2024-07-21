import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:soundcloud/likesong.dart';
import 'package:soundcloud/model/songs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Consumer<lovesong>(
            builder: (context, value, child) => Column(children: [
                  //horizontal scrolling
                  // Container(
                  //   height: 150,
                  //   child: ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 10,
                  //     itemBuilder: ((context, index) {
                  //       return const MyCircle();
                  //     }),
                  //   ),
                  // ),

                  // vertical scrolling
                  Expanded(
                    child: ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 1.8, left: 15.0),
                          child: Text(
                            'More of what you like',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Recently Played',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Qatar Famous 2024',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: SizedBox(
                              height: 350,
                              child: Image(
                                image: AssetImage('images/song11.jpg'),
                                fit: BoxFit.fill,
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Introducing Buzzing',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Workout',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Mixed for You',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Made For You',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 2.0, left: 15.0),
                          child: Text(
                            'Trending on SoundCloud',
                            style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 10,
                              itemBuilder: ((context, index) {
                                songs song = value.getsonglist()[index];
                                //=== maunally
                                //songs(
                                // songname: 'In the Name of Love ',
                                // singer: ' Bebe Rexha',
                                // imagepath: 'images/song1.jpg');
                                //======
                                return Songtile(
                                  song: song,
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}

class MyCircle extends StatelessWidget {
  const MyCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.pink,
          shape: BoxShape.rectangle,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class Songtile extends StatelessWidget {
  songs song;
  Songtile({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.0),
      width: 150,
      height: 150,
      decoration: BoxDecoration(
          //color: Colors.amber,
          //borderRadius: BorderRadius.circular(12),
          ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        ClipRRect(
          // song image path 'images/logo.png'
          child: Container(
            height: 115,
            width: 150,
            child: Image.asset(song.imagepath,
                fit: BoxFit.fill, height: 115, width: 150),
          ),
        ),
        //song name
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            song.songname,
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
        //singer
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            song.singer,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ]),
    );
  }
}

//model for song
// class songs {
//   final String songname;
//   final String singer;
//   final String imagepath;
//   //construstor
//   songs(
//       {required this.songname, required this.singer, required this.imagepath});
// }

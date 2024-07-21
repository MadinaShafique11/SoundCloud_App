// ignore_for_file: unused_import

import 'dart:core';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundcloud/firstpage.dart';
import 'package:soundcloud/home.dart';
import 'package:soundcloud/likesong.dart';
import 'package:soundcloud/model/songs.dart';

class CurrentSong extends StatefulWidget {
  @override
  State<CurrentSong> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CurrentSong> {
//convert seconds in mint:seconds
  String formatTime(Duration duration) {
    String twoDigitSeconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formatedTime = "${duration.inMinutes}:$twoDigitSeconds ";
    return formatedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<lovesong>(builder: (context, value, child) {
      // get palylist
      final playlist = value.playlist;

      //get currentn song index
      final currentSong = playlist[value.currentplayingsong ?? 0];

      return Scaffold(
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                flex: 18,
                child: Container(
                  margin:
                      EdgeInsets.only(top: 20, bottom: 20, left: 5, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(currentSong
                          .imagepath), // Replace with your own image asset
                      fit:
                          BoxFit.cover, // This determines the fill/match aspect
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            currentSong.songname,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.white),
                          ),
                          subtitle: Text(
                            currentSong.singer,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                          trailing: Ink(
                            decoration: const ShapeDecoration(
                              color: Color.fromARGB(255, 27, 99, 134),
                              shape: CircleBorder(),
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              FirstPage(title: 'home')));
                                },
                                icon: const Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                )),
                          ),
                        ),
                        const Expanded(flex: 1, child: Text('')),
                        //SliderTheme(data: data, child: child)
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 50, right: 50),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        value.playPreviousSong();
                                      },
                                      icon: const Icon(
                                        Icons.skip_previous,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        value.pauseOrResume();
                                      },
                                      icon: Icon(
                                        value.isplaying
                                            ? Icons.pause
                                            : Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 40,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        value.playNextSong();
                                      },
                                      icon: const Icon(
                                        Icons.skip_next,
                                        color: Colors.white,
                                      )),
                                ],
                              ),
                            )),
                        Expanded(
                            // child: Align(
                            //     alignment: Alignment.bottomCenter,
                            //     child: SliderTheme(
                            //         data: SliderTheme.of(context).copyWith(
                            //           thumbShape:
                            //                const RoundRangeSliderThumbShape(enabledThumbRadius = 10.0),),
                            //         child: Slider(
                            //             value: 50,
                            //             min: 0,
                            //             max: 100,
                            //             onChanged: (value) {}))),
                            child: Column(
                          children: [
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(formatTime(value.currentDuration),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                const Text('|',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                                Text(formatTime(value.totalDuartion),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white)),
                              ],
                            )),
                            SliderTheme(
                              data: const SliderThemeData(
                                  //thumbColor: Colors.green,
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 0)),
                              child: Slider(
                                value:
                                    value.currentDuration.inSeconds.toDouble(),
                                min: 0,
                                max: value.totalDuartion.inSeconds.toDouble(),
                                activeColor: Color.fromARGB(255, 252, 97, 26),
                                onChanged: (double double) {
                                  //when user is moving slider
                                },
                                onChangeEnd: (double double) {
                                  value.seek(Duration(seconds: double.toInt()));
                                },
                              ),
                            ),
                          ],
                        ))
                      ]),
                ),
              ),
              Expanded(
                //flex: 1,
                child: Container(
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.comment,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.playlist_play,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.more_vert,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

import 'package:flutter/cupertino.dart';

import 'home.dart';

class lovesong extends ChangeNotifier {
  //liked song
  List<songs> likesong = [
    songs(
        songname: 'In the Name of Love ',
        singer: ' Bebe Rexha',
        imagepath: 'images/song1.jpg'),
    songs(
        songname: 'Set Fire to the Rain ',
        singer: ' Adele',
        imagepath: 'images/song2.jpg'),
    songs(
        songname: 'Dynamite (방탄소년단) ',
        singer: ' BTS',
        imagepath: 'images/song3.png'),
    songs(
        songname: 'Waka Waka ',
        singer: ' Shakira',
        imagepath: 'images/song5.jpg'),
    songs(
        songname: 'A Thousand Years ',
        singer: ' Christina Perri',
        imagepath: 'images/song6.jpg'),
    songs(
        songname: 'fitoor ost ',
        singer: 'Shani Arshad, Aima Baig',
        imagepath: 'images/song7.jpg'),
    songs(songname: 'Butter ', singer: ' BTS', imagepath: 'images/song4.jpg'),
    songs(
        songname: 'Lemonade ',
        singer: 'Diljit Dosanjh',
        imagepath: 'images/song8.jpg'),
    songs(
        songname: 'Hass Hass ',
        singer: 'Diljit Dosanjh,Sia',
        imagepath: 'images/song9.jpg'),
    songs(
        songname: 'Cheap Thrills ',
        singer: 'Sia',
        imagepath: 'images/song10.jpg'),
  ];
  //list of like song
  List<songs> getsonglist() {
    return likesong;
  }

  //adding more song
  void addsongtolike(songs song) {
    likesong.add(song);
    notifyListeners();
  }

  //removing like song
  void removesong(songs song) {
    likesong.remove(song);
    notifyListeners();
  }
}

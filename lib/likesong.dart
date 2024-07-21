import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:soundcloud/activities.dart';
import 'package:soundcloud/current-playing-song.dart';
import 'package:soundcloud/feeds.dart';
import 'package:soundcloud/library.dart';
import 'package:soundcloud/model/songs.dart';
import 'package:soundcloud/search.dart';
import 'package:soundcloud/subscribe.dart';
import 'package:soundcloud/upgrade.dart';
import 'package:soundcloud/upload.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:audioplayers/audio_cache.dart';

import 'firstpage.dart';
import 'home.dart';
import 'main.dart';

class lovesong extends ChangeNotifier {
  //liked song
  List<songs> likesong = [
    const songs(
        songname: 'In the Name of Love ',
        singer: ' Bebe Rexha',
        imagepath: 'images/song1.jpg',
        saudio: 'songs/song1.mp3'),
    const songs(
        songname: 'Set Fire to the Rain ',
        singer: ' Adele',
        imagepath: 'images/song2.jpg',
        saudio: 'songs/setfire.mp3'),
    const songs(
        songname: 'Dynamite (방탄소년단) ',
        singer: ' BTS',
        imagepath: 'images/song3.png',
        saudio: 'songs/song2.mp3'),
    const songs(
        songname: 'Waka Waka ',
        singer: ' Shakira',
        imagepath: 'images/song5.jpg',
        saudio: 'songs/song3.mp3'),
    const songs(
        songname: 'A Thousand Years ',
        singer: ' Christina Perri',
        imagepath: 'images/song6.jpg',
        saudio: 'songs/song1.mp3'),
    const songs(
        songname: 'fitoor ost ',
        singer: 'Shani Arshad, Aima Baig',
        imagepath: 'images/song7.jpg',
        saudio: 'songs/song2.mp3'),
    const songs(
        songname: 'Butter ',
        singer: ' BTS',
        imagepath: 'images/song4.jpg',
        saudio: 'songs/song3.mp3'),
    const songs(
        songname: 'Lemonade ',
        singer: 'Diljit Dosanjh',
        imagepath: 'images/song8.jpg',
        saudio: 'songs/song1.mp3'),
    const songs(
        songname: 'Hass Hass ',
        singer: 'Diljit Dosanjh,Sia',
        imagepath: 'images/song9.jpg',
        saudio: 'songs/song2.mp3'),
    const songs(
        songname: 'Cheap Thrills ',
        singer: 'Sia',
        imagepath: 'images/song10.jpg',
        saudio: 'songs/song3.mp3'),
  ];

  // current playing  song
  int? _currentplayingsong;

  /// *---------audio player -------*
  // 1. audio player
  final AudioPlayer _audioPlayer = AudioPlayer();
  // 2. Duration
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;
  //3. constructor
  lovesong() {
    listentoDuartion();
  }
  //4. initially not playing
  bool _isPlaying = false;
  //5. /play the song
  void play() async {
    final String path = likesong[_currentplayingsong!].saudio;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  //13. pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  //6. resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // 7. pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // 8. seek to specific position
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // 9. play next song
  void playNextSong() {
    if (currentplayingsong != null) {
      if (currentplayingsong! < likesong.length - 1) {
        //go to next song if it isnot last song
        currentplayingsong = _currentplayingsong! + 1;
      } else {
        //if last song make a loop
        currentplayingsong = 0;
      }
    }
  }

  // 10. play previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentplayingsong! > 0) {
        currentplayingsong = _currentplayingsong! - 1;
      } else {
        //if it is not the first song .loop back to the last song
        currentplayingsong = likesong.length - 1;
      }
    }
  }

  // 11. listen to |Duration
  void listentoDuartion() {
    //listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuraton) {
      _totalDuration = newDuraton;
      notifyListeners();
    });
    //listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });
    //listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // 12. dispose audio player.

  // *----------getter--------*
  List<songs> get playlist => likesong;
  int? get currentplayingsong => _currentplayingsong;
  bool get isplaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuartion => _totalDuration;
  //*-------setter------*
  set currentplayingsong(int? newIndex) {
    _currentplayingsong = newIndex;
    if (newIndex != null) {
      play();
    }
    notifyListeners();
  }

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

class Liketracks extends StatefulWidget {
  const Liketracks({super.key});

  @override
  State<Liketracks> createState() => _LiketracksState();
}

class _LiketracksState extends State<Liketracks> {
  var _myIndex = 3;

  List<Widget> _pages = const [
    Home(),
    Feeds(),
    Search(),
    Library(),
    Upgarde(),
  ];
  //final player = AudioPlayer(playerId: 'my_unique_playerId');
  //var player = AssetSource('songs/song1.mp3');
  AudioPlayer audioPlayer = AudioPlayer();
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 29, 29, 28).withOpacity(1.0),
          foregroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.chevron_left),
              ),
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
              Text("home", textAlign: TextAlign.right),
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
        //======floating actiin button
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
              backgroundColor: Color.fromARGB(255, 29, 29, 28).withOpacity(0.8),
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
        ///////=======================
        body: getbody(),
        ////============
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 41, 40, 40),
          selectedItemColor: const Color.fromARGB(232, 240, 32, 4),
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
        ),
      ),
    );
  }

  Future<void> playsound() async {
    String songPath = "songs/setfire.mp3";
    await player.play(AssetSource(songPath));
  }

  getbody() {
    switch (_myIndex) {
      case 0:
        return Home();
      case 1:
        return Feeds();
      case 2:
        return Search();
      case 3:
        return _bodyOne();
      case 4:
        return Upgarde();
    }
  }
}

//fisrt body for index =3
class _bodyOne extends StatefulWidget {
  const _bodyOne({super.key});

  @override
  State<_bodyOne> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_bodyOne> {
  AudioPlayer audioPlayer = AudioPlayer();
  static AudioPlayer currentplayingsong = AudioPlayer();
  static String songname = "Set fire to the Rain";
  static String artistname = "Andele \n5:30";
  AssetImage songImage = AssetImage('images/setfiretorain.png');
  // passongdetails() {
  //   // Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //         builder: (context) => CurrentSong(
  //   //             // currentplayingsong: currentplayingsong.toString(),
  //   //             // songname: songname.toString(),
  //   //             // artistname: artistname,
  //   //             // songImage: songImage.toString(),
  //   //             )));
  // }

  // _handletap() {
  //   playsound();
  //   //passongdetails();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(48),
                    child: Image(image: songImage),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.only(left: 8),
                  child: ListTile(
                    onTap: () => playsound(),
                    //onTap: _handletap(),

                    dense: false,
                    //tileColor: Colors.amber,
                    title: Text(
                      songname,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    subtitle: Text(
                      artistname,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    isThreeLine: true,
                    trailing: IconButton(
                        onPressed: () => currentplayingsong.stop(),
                        icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        )),
                    contentPadding:
                        const EdgeInsets.only(left: 0, right: 0, top: 2.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> playsound() async {
    String songPath = "songs/setfire.mp3";
    await currentplayingsong.play(AssetSource(songPath));
  }
  //class song
}

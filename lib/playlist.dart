import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soundcloud/activities.dart';
import 'package:soundcloud/current-playing-song.dart';
import 'package:soundcloud/feeds.dart';
import 'package:soundcloud/home.dart';
import 'package:soundcloud/library.dart';
import 'package:soundcloud/likesong.dart';
import 'package:soundcloud/model/songs.dart';
import 'package:soundcloud/search.dart';
import 'package:soundcloud/subscribe.dart';
import 'package:soundcloud/upgrade.dart';
import 'package:soundcloud/upload.dart';

class playlist extends StatefulWidget {
  const playlist({super.key});

  @override
  State<playlist> createState() => _playlistState();
}

class _playlistState extends State<playlist> {
  var _myIndex = 3;

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

class _bodyOne extends StatefulWidget {
  const _bodyOne({super.key});

  @override
  State<_bodyOne> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<_bodyOne> {
  late final dynamic playlistprovider;
  @override
  void initState() {
    super.initState();
    playlistprovider = Provider.of<lovesong>(context, listen: false);
  }

  //goto song
  void gotoSong(int songIndex) {
    //update current song index
    /// H E R E
    //lovesong Lovesong = lovesong();
    playlistprovider.currentplayingsong = songIndex;
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => CurrentSong()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Consumer<lovesong>(
        builder: (context, value, child) {
          //get likesong list
          final List<songs> playlist = value.playlist;
          //retune Ui
          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                //get individual song
                final songs song = playlist[index];
                return Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ClipRect(
                        //borderRadius: BorderRadius.circular(20),
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(48),
                          child: Image.asset(
                            song.imagepath,
                            height: 20,
                            width: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.only(left: 8),
                        child: ListTile(
                          onTap: () => gotoSong(index),
                          //onTap: _handletap(),

                          dense: false,
                          //tileColor: Colors.amber,
                          title: Text(
                            song.songname,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          subtitle: Text(
                            song.singer,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                              onPressed: () {}, //=> currentplayingsong.stop(),
                              icon: const Icon(
                                Icons.more_horiz,
                                color: Colors.white,
                              )),
                          contentPadding: const EdgeInsets.only(
                              left: 0, right: 0, top: 2.0),
                        ),
                      ),
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}

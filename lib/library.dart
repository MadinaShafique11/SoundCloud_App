import 'package:flutter/material.dart';
import 'package:soundcloud/likesong.dart';
import 'package:soundcloud/playlist.dart';

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      //padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 59, 58, 53),
      ),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Liketracks()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Liked tracks',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => playlist()));
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Playlists',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Albums',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Following',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Stations',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 59, 58, 53),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusDirectional.circular(5))),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Your Uploads',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              )),
        ],
      ),
    ));
  }
}

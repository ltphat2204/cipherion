import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/features/music/screens/navigation_menu.dart';

class TrackViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return TrackView(
            lyricsDisplay: index == 1,
          );
        },
      ),
    );
  }
}

class TrackView extends StatelessWidget {
  bool lyricsDisplay;

  TrackView({required this.lyricsDisplay});

  @override
  Widget build(BuildContext context) {
    if (lyricsDisplay) {
      return Container(
        child: Center(
          child: Text(
            'Lyrics',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: Colors.white,
                ),
          ),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(32, 18, 57, 1),
              Color.fromRGBO(21, 16, 26, 1),
              Color.fromRGBO(0, 0, 0, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            //header
            Container(
              width: 400,
              height: 40,
              margin: EdgeInsets.only(top: 60, left: 30),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Positioned(
                      child: Transform.rotate(
                        angle: 540 * 3.14 / 360,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                  //name
                  Positioned(
                    top: 8,
                    left: 76,
                    child: Text(
                      'Chiu cach minh noi thua',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  // add
                  Positioned(
                    top: 8,
                    right: 30,
                    child: Image.asset(
                      'assets/icons/add.png',
                      color: Colors.white,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            //image
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: 340,
              height: 340,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image:
                      AssetImage('assets/images/song_covers/song_cover2.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Name
            Container(
              margin: EdgeInsets.only(top: 55),
              child: Text(
                'Chiu cach minh noi thua',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),

            // Artist
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Rhyder va tao',
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                      color: Color.fromRGBO(182, 182, 182, 1),
                    ),
              ),
            ),
            // Slider song
            //
            //
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 3,
              width: 300,
              color: Colors.white,
            ),

            // Control
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Row(
                children: [
                  // Repeat
                  Container(
                    margin: EdgeInsets.only(right: 40, left: 36),
                    child: Image.asset(
                      'assets/icons/repeat.png',
                      color: Colors.white,
                      width: 24,
                    ),
                  ),

                  // back
                  Container(
                    child: Image.asset(
                      'assets/icons/control.png',
                      color: Colors.white,
                      width: 30,
                    ),
                  ),

                  // play button
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40),
                    child: Image.asset(
                      'assets/icons/play_button.png',
                      color: Colors.white,
                      width: 70,
                    ),
                  ),

                  // next
                  Container(
                    child: Transform.rotate(
                      angle: 180 * 3.14 / 180,
                      child: Image.asset(
                        'assets/icons/control.png',
                        color: Colors.white,
                        width: 30,
                      ),
                    ),
                  ),

                  // heart
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    child: Image.asset(
                      'assets/icons/heart.png',
                      color: Colors.white,
                      width: 24,
                    ),
                  ),
                ],
              ),
            ),
            // Swipe
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Text(
                'Swipe for lyrics >>',
                style: Theme.of(context).textTheme.titleLarge!.apply(
                      color: Color.fromRGBO(182, 182, 182, 1),
                    ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

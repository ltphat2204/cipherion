import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/popup_music/popup_music.dart';
import 'package:music_lyrica/common/widgets/slider/slider_top_playlists.dart';
import 'package:music_lyrica/common/widgets/song_cover/song_cover_horizontal.dart';
import 'package:music_lyrica/common/widgets/song_cover/song_cover_vertical.dart';
import 'package:music_lyrica/common/widgets/special/avatar.dart';
import 'package:music_lyrica/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(color: TColors.primaryBackground),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        // Background
                        Container(
                          height: 390,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerRight,
                              end: Alignment.centerLeft,
                              colors: [
                                Color.fromRGBO(106, 53, 219, 1),
                                Color.fromRGBO(195, 71, 216, 1),
                              ],
                            ),
                            image: DecorationImage(
                                image: AssetImage('assets/background2.png'),
                                fit: BoxFit.none,
                                opacity: 0.80,
                                scale: 1.5,
                                alignment: Alignment(0.0, 0.85)),
                          ),
                        ),

                        // Fade effect
                        Container(
                          height: 390,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                TColors.primaryBackground,
                                Color.fromRGBO(0, 0, 0, 0),
                              ],
                            ),
                          ),
                        ),

                        // Avatar
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50, left: 30),
                              width: 190,
                              child: Text(
                                'TOP PLAYLISTS',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .apply(
                                      letterSpacingDelta: 2,
                                    ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 50, left: 120),
                                child: Avatar(height: 50, width: 50)),
                          ],
                        ),
                        // SLIDER
                        Container(
                          padding: EdgeInsets.only(right: 40),
                          margin: EdgeInsets.only(top: 170),
                          height: 320,
                          width: MediaQuery.of(context).size.width,
                          child: MySlider(),
                        ),
                      ],
                    ),

                    // TRENDING
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 30, bottom: 10),
                      width: 170,
                      child: Text(
                        'Trending',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    // Trending List
                    Container(
                      height: 185,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.87),
                        itemCount: 3,
                        itemBuilder: (context, index) => Container(
                          height: 185,
                          // color: Colors.blue,
                          margin: EdgeInsets.only(top: 0, left: 6),
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(bottom: 5, top: 5),
                                child: SongCoverHorizontal(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    //Today recommendations
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30),
                          width: 300,
                          child: Text(
                            'Today recommendations songs',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                        Container(
                          height: 207,
                          margin: EdgeInsets.only(top: 0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return SongCoverVertical();
                            },
                          ),
                        ),
                      ],
                    ),

                    // Artists
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 30),
                            width: 170,
                            child: Text(
                              'Artists you may like',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          // Artists List
                          Container(
                            height: 160,
                            margin: EdgeInsets.only(top: 0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    // Avatar
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, left: 28),
                                      height: 100,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/artists/art1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Artist Name
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 16),
                                      child: Text(
                                        'Artist Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    // More for you
                    Container(
                      height: 280,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, left: 30),
                            width: 170,
                            child: Text(
                              'More for you',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          // Artists List
                          Container(
                            height: 160,
                            margin: EdgeInsets.only(top: 0),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    // Avatar
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 20, left: 30),
                                      height: 100,
                                      width: 100,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/artists/art1.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    // Artist Name
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, left: 16),
                                      child: Text(
                                        'Favourite Artist',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Popup song
          Positioned(
            bottom: 10,
            left: 26,
            child: PopUpMusic(),
          ),
        ],
      ),
    );
  }
}

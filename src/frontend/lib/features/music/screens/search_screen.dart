import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/popup_music/popup_music.dart';
import 'package:music_lyrica/common/widgets/search/search_bar.dart';
import 'package:music_lyrica/common/widgets/special/group_of_playlist.dart';
import 'package:music_lyrica/utils/constants/colors.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  TColors.primaryBackground,
                  Colors.black,
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 24, top: 50),
                    width: 200,
                    child: Text(
                      'Explore your music',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            letterSpacingDelta: 1.5,
                          ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                    child: MySearchBar(),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 11),
                    height: 980,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return GroupOfPlayList(itemStart: index * 4);
                        },
                        itemCount: 2),
                  ),
                ],
              ),
            ),
          ),
          // Popup song
          const Positioned(
            bottom: 10,
            left: 26,
            child: PopUpMusic(),
          ),
        ],
      ),
    );
  }
}

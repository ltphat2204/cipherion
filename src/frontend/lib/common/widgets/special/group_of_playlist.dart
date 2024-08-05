import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/playlist_card/playlist_card.dart';

class GroupOfPlayList extends StatelessWidget {
  int itemStart;
  GroupOfPlayList({required this.itemStart});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      margin: const EdgeInsets.only(left: 11),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: PlaylistCard(
              height: 300,
              width: 180,
              image: 'assets/images/playlists/play${itemStart + 1}.png',
            ),
          ),
          Positioned(
            top: 0,
            left: 190,
            child: PlaylistCard(
              height: 120,
              width: 180,
              image: 'assets/images/playlists/play${itemStart + 2}.png',
            ),
          ),
          Positioned(
            top: 310,
            left: 0,
            child: PlaylistCard(
              height: 120,
              width: 180,
              image: 'assets/images/playlists/play${itemStart + 3}.png',
            ),
          ),
          Positioned(
            top: 130,
            left: 190,
            child: PlaylistCard(
              height: 300,
              width: 180,
              image: 'assets/images/playlists/play${itemStart + 4}.png',
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/song_cover/song_cover.dart';

class SongCoverHorizontal extends SongCover {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateToTrackViewScreen,
      child: Row(
        children: [
          // avatar
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage('assets/images/song_covers/song_cover1.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // song name and artist name
          Container(
            margin: EdgeInsets.only(left: 10, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  ' Song Name',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  'Artist\'s Name',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
          // ...
          Container(
            margin: EdgeInsets.only(left: 130),
            child: IconButton(
              icon: const Icon(
                Icons.more_horiz,
                color: Color.fromRGBO(137, 139, 170, 1),
                size: 20,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

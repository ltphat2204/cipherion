import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/song_cover/song_cover.dart';

class SongCoverVertical extends SongCover {
  @override
  Widget build(BuildContext context) {
    // Add a return statement here
    return InkWell(
      onTap: navigateToTrackViewScreen,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Container(
              margin: EdgeInsets.only(top: 20, left: 30),
              height: 140,
              width: 220,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: AssetImage('assets/images/playlists/play1.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Artist Name
            Container(
              margin: EdgeInsets.only(left: 30, top: 6),
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
          ],
        ),
      ),
    );
  }
}

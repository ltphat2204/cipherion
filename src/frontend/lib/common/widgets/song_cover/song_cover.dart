import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:music_lyrica/features/music/screens/track_view_screen.dart';

class SongCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  void navigateToTrackViewScreen() {
    Get.to(() => TrackViewScreen());
  }
}

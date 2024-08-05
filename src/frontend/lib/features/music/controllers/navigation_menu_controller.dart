import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_lyrica/features/music/screens/album_screen.dart';
import 'package:music_lyrica/features/music/screens/home_screen.dart';
import 'package:music_lyrica/features/music/screens/premium_screen.dart';
import 'package:music_lyrica/features/music/screens/search_screen.dart';

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    AlbumScreen(),
    PremiumScreen(),
  ];
}

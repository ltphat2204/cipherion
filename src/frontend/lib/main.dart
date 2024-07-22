// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_lyrica/features/authentication/screens/login/login_screen.dart';
import 'package:music_lyrica/features/music/screens/following_artist_screen.dart';
import 'package:music_lyrica/features/music/screens/recent_listen_screen.dart';
import 'package:music_lyrica/utils/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: //FollowingArtistScreen(),
          RecentListenScreen(),
      //const LoginScreen(),
    );
  }
}

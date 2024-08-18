import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lyrica_ver2/features/music/controllers/playlist_controller.dart';
import 'package:lyrica_ver2/features/music/screens/recent_listen_screen.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
        child: Swiper(
          axisDirection: AxisDirection.right,
          itemCount: 3,
          layout: SwiperLayout.STACK,
          itemWidth: 300,
          itemHeight: 320,
          loop: true,
          duration: 500,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.to(() => RecentListenScreen(
                      playlistName: PlaylistController.to.playlist[index].name,
                    ));
              },
              child: Stack(
                children: [
                  Container(
                    width: 400,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/playlists/play${index + 1}.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    left: 20,
                    child: Container(
                      height: 70,
                      width: 200,
                      child: Text(
                        PlaylistController.to.playlist[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 22,
                    child: Text(
                      "${PlaylistController.to.playlist[index].songs.length} tracks",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

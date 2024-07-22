import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            return Stack(
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
                const Positioned(
                  bottom: 50,
                  left: 20,
                  child: Text(
                    "Jazz Playlist",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Positioned(
                  bottom: 30,
                  left: 22,
                  child: Text(
                    "30 tracks",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

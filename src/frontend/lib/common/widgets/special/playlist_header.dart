import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_lyrica/common/widgets/special/avatar.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: Stack(
        children: [
          // AVATAR
          Positioned(
            top: -40,
            left: -70,
            child: Avatar(
              height: 30,
              width: 30,
            ),
          ),
          // Playlist name
          Positioned(
            top: 16,
            left: 100,
            child: Text('Playlist Name',
                style: Theme.of(context).textTheme.bodyLarge!),
          ),
          // icon
          Positioned(
            top: 50,
            left: 50,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 24,
                  width: 24,
                  child: Image(
                    image: AssetImage('assets/icons/shuffle.png'),
                    color: Color.fromRGBO(137, 149, 170, 1),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  height: 24,
                  width: 24,
                  child: Image(
                    image: AssetImage('assets/icons/add.png'),
                    color: Color.fromRGBO(137, 149, 170, 1),
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  child: Image(
                    image: AssetImage('assets/icons/more.png'),
                    color: Color.fromRGBO(137, 149, 170, 1),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 50,
            top: 10,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Color.fromRGBO(195, 71, 216, 1),
                borderRadius: BorderRadius.circular(50),
              ),
              child:
                  Icon(Icons.play_arrow_rounded, color: Colors.white, size: 40),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PopUpMusic extends StatelessWidget {
  const PopUpMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width - 50,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(106, 53, 219, 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            margin: EdgeInsets.only(left: 0, top: 14),
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
          // play button
          Container(
            margin: EdgeInsets.only(left: 120),
            child: IconButton(
              icon: const Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

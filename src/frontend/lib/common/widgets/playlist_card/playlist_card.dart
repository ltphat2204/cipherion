import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class PlaylistCard extends StatelessWidget {
  double height;
  double width;
  String image;

  PlaylistCard(
      {required this.height, required this.width, required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

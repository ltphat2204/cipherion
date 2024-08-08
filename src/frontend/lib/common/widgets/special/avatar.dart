import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/features/personalization/screens/personal.dart';

class Avatar extends StatelessWidget {
  double height;
  double width;
  Avatar({required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PersonalScreen()));
      },
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(150),
          border: Border.all(
            color: Color.fromRGBO(207, 134, 237, 1),
            width: 3,
          ),
          image: const DecorationImage(
            image: AssetImage('assets/icons/person.png'),
          ),
        ),
      ),
    );
  }
}

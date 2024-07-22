import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(106, 53, 219, 0.85),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const TextField(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 12),
          hintText: 'Search ',
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

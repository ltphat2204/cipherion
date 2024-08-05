import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_lyrica/utils/constants/colors.dart';
import 'package:music_lyrica/utils/constants/image_string.dart';

class ChooseAvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 1000,
        decoration: const BoxDecoration(color: Color.fromRGBO(33, 15, 51, 1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Back
            Container(
              margin: const EdgeInsets.only(top: 50, left: 24),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Text(
                  'Set your avatar',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(133, 128, 167, 1),
                      borderRadius: BorderRadius.circular(150),
                    ),
                    margin: EdgeInsets.only(top: 60),
                  ),
                  Positioned(
                    top: 80,
                    left: 24,
                    child: Container(
                      child: Image.asset(
                        'assets/icons/person.png',
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                width: 350,
                height: 300,
                margin: const EdgeInsets.only(top: 26),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  children: List.generate(
                    ImageString().imageString.length,
                    (index) {
                      if (index == 0) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 19,
                                left: 18,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.image_rounded,
                                    color: Colors.black,
                                    size: 50,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(60),
                            image: DecorationImage(
                              image: AssetImage(
                                ImageString().imageString[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 160,
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Done'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/special/avatar.dart';
import 'package:music_lyrica/utils/constants/colors.dart';

class PersonalScreen extends StatelessWidget {
  const PersonalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  TColors.primaryBackground,
                  Color.fromRGBO(21, 16, 26, 1),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // HEADER
                Stack(
                  children: [
                    // Background
                    Container(
                      height: 230,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerRight,
                          end: Alignment.centerLeft,
                          colors: [
                            Color.fromRGBO(195, 71, 216, 1),
                            Color.fromRGBO(106, 53, 219, 1),
                          ],
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/background.png'),
                          fit: BoxFit.fitWidth,
                          opacity: 0.65,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 30),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 50, left: 240),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.5,
                              color: Colors.white,
                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Edit',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 180, left: 160),
                      child: Avatar(height: 100, width: 100),
                    ),
                  ],
                ),
                // BODY

                // USER NAME

                Container(
                  margin: const EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    'User Name',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                // USER STATUS
                Container(
                  margin: const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    'This is a very long status that is going to be displayed here',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: Color.fromRGBO(137, 139, 170, 1)),
                  ),
                ),
                // FOLLOWERS AND FOLLOWING
                Container(
                  margin: const EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          '1000 Following',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10, left: 10),
                        child: Text(
                          '1000 Followers',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ],
                  ),
                )

                // MOST LISTENED

                ,
                Container(
                  margin: EdgeInsets.only(top: 20, right: 180, bottom: 10),
                  width: 170,
                  child: Text(
                    'Most Listened',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                // MOST LISTENED LIST
                Container(
                  height: 185,
                  child: PageView.builder(
                    controller: PageController(viewportFraction: 0.87),
                    itemCount: 3,
                    itemBuilder: (context, index) => Container(
                      height: 185,
                      // color: Colors.blue,
                      margin: EdgeInsets.only(top: 0, left: 6),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 5, top: 5),
                            child: Row(
                              children: [
                                // avatar
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/song_covers/song_cover1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // song name and artist name
                                Container(
                                  margin: EdgeInsets.only(left: 10, top: 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        ' Song Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        'Artist\'s Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                    ],
                                  ),
                                ),
                                // ...
                                Container(
                                  margin: EdgeInsets.only(left: 130),
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Color.fromRGBO(137, 139, 170, 1),
                                      size: 20,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),

                // RELEASED
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 30),
                      width: 300,
                      child: Text(
                        'Released',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Container(
                      height: 207,
                      margin: EdgeInsets.only(top: 0),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Avatar
                              Container(
                                margin: EdgeInsets.only(top: 20, left: 30),
                                height: 140,
                                width: 140,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/playlists/play1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Artist Name
                              Container(
                                margin: EdgeInsets.only(left: 30, top: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      ' Song Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    Text(
                                      'Artist\'s Name',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),

                //PLAYLISTS

                Container(
                  height: 270,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20, left: 30),
                        width: 170,
                        child: Text(
                          'Playlists',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      Container(
                        height: 190,
                        margin: EdgeInsets.only(top: 0),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                // Avatar
                                Container(
                                  margin: EdgeInsets.only(top: 20, left: 28),
                                  height: 140,
                                  width: 140,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/artists/art1.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                // Artist Name
                                Container(
                                  margin: EdgeInsets.only(top: 10, right: 20),
                                  child: Text(
                                    'Playlist Name',
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

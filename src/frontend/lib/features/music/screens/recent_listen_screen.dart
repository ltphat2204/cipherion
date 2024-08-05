import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_lyrica/common/widgets/special/avatar.dart';
import 'package:music_lyrica/common/widgets/special/playlist_header.dart';

class RecentListenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 150,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50, left: 30),
                    width: 170,
                    child: Text(
                      'RECENTLY LISTENED',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            letterSpacingDelta: 2,
                          ),
                    ),
                  ),
                  Avatar(
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(66, 204, 71, 193),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60),
                      ),
                    ),
                    height: 716,
                    child: Column(
                      children: [
                        // playlist header
                        const PlaylistHeader(),
                        Container(
                          height: 600,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.only(
                                  bottom: 5, top: 10, left: 50, right: 10),
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
                                    margin:
                                        const EdgeInsets.only(left: 10, top: 6),
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
                                    margin: const EdgeInsets.only(left: 130),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.more_horiz,
                                        color: Color.fromRGBO(137, 139, 170, 1),
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        // SHOW DIALOG
                                        showDialog(
                                            barrierColor: const Color.fromRGBO(
                                                15, 5, 26, 0.75),
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor:
                                                    const Color.fromRGBO(
                                                        15, 5, 26, 0.75),
                                                actionsAlignment:
                                                    MainAxisAlignment.center,
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    // Cancel button 
                                                    child: Container(
                                                      height: 50,
                                                      width: 110,
                                                      decoration: BoxDecoration(
                                                        color: const Color
                                                            .fromRGBO(
                                                            106, 53, 219, 1),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          'Cancel',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineSmall,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                                content: Container(
                                                  decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        23, 14, 31, 1),
                                                    border: Border.all(
                                                        width: 1.5,
                                                        color: const Color
                                                            .fromRGBO(
                                                            106, 53, 219, 1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  height: 120,
                                                  width: double.maxFinite,
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        margin: const EdgeInsets
                                                            .only(
                                                            top: 24,
                                                            bottom: 20),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          16),
                                                              height: 24,
                                                              width: 24,
                                                              child: const Image(
                                                                  image: AssetImage(
                                                                      'assets/icons/heart.png'),
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              'Add to favorites',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headlineSmall,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          // DIALOG PLAYLIST
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                content:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: const Color
                                                                        .fromRGBO(
                                                                        23,
                                                                        14,
                                                                        31,
                                                                        1),
                                                                    border: Border.all(
                                                                        width:
                                                                            1.5,
                                                                        color: const Color
                                                                            .fromRGBO(
                                                                            106,
                                                                            53,
                                                                            219,
                                                                            1)),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                  ),
                                                                  height: 300,
                                                                  width: double
                                                                      .maxFinite,
                                                                  child:
                                                                      const Column(
                                                                    children: [
                                                                      // SEARCH BAR
                                                                      //
                                                                    ],
                                                                  ),
                                                                ),
                                                                backgroundColor:
                                                                    const Color
                                                                        .fromRGBO(
                                                                        23,
                                                                        14,
                                                                        31,
                                                                        1),
                                                                actionsAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                actions: [
                                                                  TextButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50,
                                                                      width:
                                                                          110,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: const Color
                                                                            .fromRGBO(
                                                                            106,
                                                                            53,
                                                                            219,
                                                                            1),
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            Text(
                                                                          'Cancel',
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .headlineSmall,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                            child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          16),
                                                              height: 24,
                                                              width: 24,
                                                              child: const Image(
                                                                  image: AssetImage(
                                                                      'assets/icons/add.png'),
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                            Text(
                                                              'Add to a playlist',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headlineSmall,
                                                            ),
                                                          ],
                                                        )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

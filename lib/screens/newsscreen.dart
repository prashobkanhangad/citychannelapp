import 'dart:developer';

import 'package:city_channel_app/model/shortnewsmodel.dart';
import 'package:city_channel_app/screens/livetvscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../model/newstimemodel.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

// String videourlnews = 'https://youtu.be/qsh2sDEFgsk';

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    // YoutubePlayerController controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(videourlnews).toString(),
    //     flags: const YoutubePlayerFlags(autoPlay: false, hideControls: false));
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('shortnews').snapshots(),
        builder: (context, snapshot) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final data =
                  Shortnewsmodel.fromMap(snapshot.data!.docs[index].data());

              // log(data.shortnewstitle.toString());
              //  videourlnews = data.newstimeurl.toString();

              return Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 235, 233, 246),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 14,
                            left: 12,
                            right: 12,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(15)),
                            width: double.maxFinite,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12,
                                      top: 12,
                                      bottom: 8),
                                  child: Container(
                                    width: double.maxFinite,
                                    // height: 200,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                    child: YoutubePlayer(
                                      controller: YoutubePlayerController(
                                          initialVideoId:
                                              YoutubePlayer.convertUrlToId(
                                                      '${data.shortnewsurl}')
                                                  .toString(),
                                          flags: const YoutubePlayerFlags(
                                              autoPlay: false,
                                              hideControls: false)),
                                      showVideoProgressIndicator: false,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12, bottom: 10),
                                  child: Container(
                                    // height: 75,
                                    child: Text(
                                      '${data.shortnewstitle}',
                                      style: GoogleFonts.notoSansMalayalam(
                                          fontSize: 18),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                color: Color.fromARGB(255, 235, 233, 246),
                // height: 10,
              );
            },
            itemCount: snapshot.data!.size,
          );
        });
  }
}

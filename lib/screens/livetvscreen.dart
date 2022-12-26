import 'package:city_channel_app/model/livestreammodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LivetvScreen extends StatefulWidget {
  const LivetvScreen({super.key});

  @override
  State<LivetvScreen> createState() => _LivetvScreenState();
}

// final videourl = 'xrhigmjf8nM';

// final videourl = 'Xn7KWR9EOGQ';
// https://youtu.be/6SVmcz0QIWA

class _LivetvScreenState extends State<LivetvScreen> {
  @override
  Widget build(BuildContext context) {
    // YoutubePlayerController controller = YoutubePlayerController(
    //     initialVideoId: YoutubePlayer.convertUrlToId(videourl).toString(),
    //     flags: const YoutubePlayerFlags(autoPlay: true, hideControls: false, isLive: true));

    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('shortnews').snapshots(),
        builder: (context, snapshot) {
          final length = snapshot.data!.size;
          final livedata =
              LiveStreammodel.fromMap(snapshot.data!.docs[length-1].data());
          return Container(
            // height: 250,
            width: double.maxFinite,
            color: Color.fromARGB(255, 235, 233, 246),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12.0, right: 12, top: 12),
                  child: Container(
                    width: double.maxFinite,
                    // height: 200,
                    color: Colors.white,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                          initialVideoId: YoutubePlayer.convertUrlToId(
                                  livedata.livestreamurl.toString())
                              .toString(),
                          flags: const YoutubePlayerFlags(
                              autoPlay: true,
                              hideControls: false,
                              isLive: true)),
                      showVideoProgressIndicator: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Container(
                    height: 35,
                    child: Row(
                      children: const [
                        Text(
                          'City Channel | Live Streaming',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}

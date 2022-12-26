// import 'dart:developer';

import 'dart:developer';

import 'package:city_channel_app/model/newstimemodel.dart';
import 'package:city_channel_app/model/shortnewsmodel.dart';
import 'package:city_channel_app/screens/slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String? videourlnewstime;

  List<Newstimemodel> basketitems = [];

  @override
  void initState() {
    // TODO: implement initState
    fetchnewstimeurl();
    super.initState();

    //
  }

  fetchnewstimeurl() async {
    var records =
        await FirebaseFirestore.instance.collection('citynewstime').get();
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (newstimemodel) => Newstimemodel(
              newstimeurl: newstimemodel['newstimeurl'], uid: newstimemodel.id),
        )
        .toList();
    setState(() {
      basketitems = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 235, 233, 246),
      child: ListView(
        children: [
          StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('citynewstime')
                  .snapshots(),
              builder: (context, snapshot) {
                final length = snapshot.data!.size;
                // final data = Newstimemodel.fromJson(
                //     snapshot.data!.docs[length -1].data());

                final citynewsdata = Newstimemodel.fromJson(
                    snapshot.data!.docs[length - 1].data());

                    log(citynewsdata.newstimeurl.toString());
                // log(data.newstimeurl.toString());
                // videourlnewstime = data.newstimeurl.toString();

                // YoutubePlayerController controller = YoutubePlayerController(
                //     initialVideoId:
                //         YoutubePlayer.convertUrlToId(videourlnewstime!)
                //             .toString(),
                //     flags: const YoutubePlayerFlags(
                //         showLiveFullscreenButton: false,
                //         autoPlay: false,
                //         hideControls: false));
                // log(videourlnewstime.toString());

                return Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 10, left: 12),
                          child: Text(
                            'City News Time',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            width: double.maxFinite,
                            // height: 200,
                            color: Colors.grey,
                            child: YoutubePlayer(
                              controller:  YoutubePlayerController(
                    initialVideoId:
                        YoutubePlayer.convertUrlToId(citynewsdata.newstimeurl.toString())
                            .toString(),
                    flags: const YoutubePlayerFlags(
                        showLiveFullscreenButton: false,
                        autoPlay: false,
                        hideControls: false)),
                              showVideoProgressIndicator: false,
                            ),
                          ),
                        )
                      ]),
                );
              }),
          Padding(
            padding:
                const EdgeInsets.only(left: 12.0, right: 12, bottom: 5, top: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10)),
              height: 360,
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                  .collection('shortnews')
                  .snapshots(),
                    builder: (context, snapshot) {
                                      final length = snapshot.data!.size;
      

                final shortnewsdata = Shortnewsmodel.fromMap(
                    snapshot.data!.docs[length - 1].data());
                      return Container(
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 10, left: 12),
                              child: Text(
                                'Latest News',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                          child: Container(
                                    width: double.maxFinite,
                                    // height: 200,
                                    color: Color.fromARGB(255, 216, 216, 216),
                                    child: YoutubePlayer(
                                      controller: YoutubePlayerController(
                                          initialVideoId:
                                              YoutubePlayer.convertUrlToId(
                                                      '${shortnewsdata.shortnewsurl}')
                                                  .toString(),
                                          flags: const YoutubePlayerFlags(
                                              autoPlay: false,
                                              hideControls: false)),
                                      showVideoProgressIndicator: false,
                                    ),
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Container(
                                height: 95,
                                child:  Text(
                                '${shortnewsdata.shortnewstitle}'  ,
                                  style:
                                   GoogleFonts.notoSansMalayalam(
                                          fontSize: 18),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                ],
              ),
            ),
          ),
          CarouselsliderScreen(),
          Container(
            height: 60,
            width: double.maxFinite,
            color: Colors.black,
            child: const Center(
              child: Text(
                'Watch City Channel Live Steaming',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Stream<List<Newstimemodel>> readnewstimeurl() => FirebaseFirestore.instance
  //     .collection('citynewstime')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Newstimemodel.fromMap(doc.data)).toList());

}

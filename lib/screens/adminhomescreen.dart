import 'package:city_channel_app/model/livestreammodel.dart';
import 'package:city_channel_app/model/newstimemodel.dart';
import 'package:city_channel_app/model/shortnewsmodel.dart';
import 'package:city_channel_app/root/colors.dart';
import 'package:city_channel_app/screens/adminLoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({super.key});

  final newstimeurlcontroller = TextEditingController();
  final shortnewscontroller = TextEditingController();

  final shortnewstilecontroller = TextEditingController();
  final livestreamurlcontroller = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 12, 3, 108),
        leadingWidth: 100,
        leading: GestureDetector(
          // onTap: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: ((context) => const MainScreen()),
          //     ),
          //   );
          // },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Image(
              width: 100,
              image: AssetImage('asset/citylogo.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => const AdminLoginScreen()),
                    ),
                  );
                },
                icon: Icon(Icons.logout)),
          )
        ],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            color: Color.fromARGB(255, 235, 233, 246),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 135,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: newstimeurlcontroller,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13.0,
                                  horizontal: 10.0,
                                ),
                                prefixIcon: const Icon(Icons.tv,
                                    color: Color.fromARGB(255, 12, 3, 108)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 12, 3, 108),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'City News Time URL Paste Here',
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 12, 3, 108))),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  createnewstimeurl(
                                      newstimeurl: newstimeurlcontroller.text);

                                  newstimeurlcontroller.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 12, 3, 108),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 275,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: shortnewscontroller,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13.0,
                                  horizontal: 10.0,
                                ),
                                prefixIcon: const Icon(Icons.tv,
                                    color: Color.fromARGB(255, 12, 3, 108)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 12, 3, 108),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'Short News URL Paste Here',
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 12, 3, 108))),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: shortnewstilecontroller,
                            maxLines: 5,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13.0,
                                  horizontal: 10.0,
                                ),
                                prefixIcon: const Icon(Icons.newspaper,
                                    color: Color.fromARGB(255, 12, 3, 108)),
                                // prefixIconConstraints: BoxConstraints(maxHeight: 0),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 12, 3, 108),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'Short News Title Type Here',
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 12, 3, 108))),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  createshortnews(
                                      shortnewsurl: shortnewscontroller.text,
                                      shortnewstitle:
                                          shortnewstilecontroller.text);
                                          shortnewscontroller.clear();
                                          shortnewstilecontroller.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 12, 3, 108),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 135,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: livestreamurlcontroller,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13.0,
                                  horizontal: 10.0,
                                ),
                                prefixIcon: const Icon(Icons.live_tv,
                                    color: Color.fromARGB(255, 12, 3, 108)),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 12, 3, 108),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                hintText: 'Live Stream URL Paste Here',
                                hintStyle: const TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 12, 3, 108))),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 150,
                            child: ElevatedButton(
                                onPressed: () {
                                  createlivestreamurl(
                                      livestreamurl:
                                          livestreamurlcontroller.text);
                                          livestreamurlcontroller.clear();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(255, 12, 3, 108),
                                    foregroundColor: const Color.fromARGB(
                                        255, 255, 255, 255)),
                                child: const Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 300,
            color: kbackgroundColor,
          )
        ],
      ),
    );
  }

  Future createnewstimeurl({required String newstimeurl}) async {
    final docUrl = FirebaseFirestore.instance.collection('citynewstime').doc();

    final newstime = Newstimemodel(
      uid: docUrl.id,
      newstimeurl: newstimeurl,
    );

    final json = newstime.toMap();

    await docUrl.set(json);
  }

  Future createshortnews(
      {required String shortnewsurl, required String shortnewstitle}) async {
    final docUrl = FirebaseFirestore.instance.collection('shortnews').doc();

    final shortnews = Shortnewsmodel(
        shortnewstitle: shortnewstitle,
        shortnewsurl: shortnewsurl,
        uid: docUrl.id);

    final json = shortnews.toMap();

    await docUrl.set(json);
  }

  Future createlivestreamurl({
    required String livestreamurl,
  }) async {
    final docUrl = FirebaseFirestore.instance.collection('liveurl').doc();

    final livestream =
        LiveStreammodel(livestreamurl: livestreamurl, uid: docUrl.id);

    final json = livestream.toMap();

    await docUrl.set(json);
  }
}

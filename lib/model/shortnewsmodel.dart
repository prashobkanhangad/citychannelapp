class Shortnewsmodel {
  String? uid;
  String? shortnewsurl;
  String? shortnewstitle;

  Shortnewsmodel({this.uid, this.shortnewsurl, this.shortnewstitle});

//recieving data from server
  // factory Shortnewsmodel.fromMap(map) {
  //   return Shortnewsmodel(
  //     uid: map['uid'],
  //     shortnewsurl: map['shortnewsurl'],
  //     shortnewstitle: map['shortnewstitle'],
  //   );
  // }

  factory Shortnewsmodel.fromMap(map) => Shortnewsmodel(
        uid: map['uid'],
        shortnewsurl: map['shortnewsurl'],
        shortnewstitle: map['shortnewstitle'],
      );

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'shortnewsurl': shortnewsurl,
      'shortnewstitle': shortnewstitle,
    };
  }
}

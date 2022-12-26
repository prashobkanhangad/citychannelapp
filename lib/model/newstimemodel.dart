class Newstimemodel {
  String? uid;
  String? newstimeurl;

  Newstimemodel({this.uid, this.newstimeurl});

//recieving data from server
  factory Newstimemodel.fromJson(Map<String, dynamic> json) {
    return Newstimemodel(
      uid: json['uid'],
      newstimeurl: json['newstimeurl'],
    );
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'newstimeurl': newstimeurl,
    };
  }
}

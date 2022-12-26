class LiveStreammodel {
  String? uid;
  String? livestreamurl;
  

  LiveStreammodel({this.uid, this.livestreamurl});

//recieving data from server
  factory LiveStreammodel.fromMap(map) {
    return LiveStreammodel(
      uid: map['uid'],
      livestreamurl: map['livestreamurl'],
    );
  }

  // sending data to server

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'livestreamurl': livestreamurl,
    };
  }
}

class NoticeboardModel {
  String? uid;
  String? eventfield;

  NoticeboardModel({this.uid, this.eventfield});

  factory NoticeboardModel.fromMap(map) {
    return NoticeboardModel(
      uid: map['uid'],
      eventfield: map['eventfield'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'eventfield': eventfield,
    };
  }
}

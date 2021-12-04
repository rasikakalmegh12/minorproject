class TimetableModel {
  String? uid;
  String? subject;
  String? start_time;
  String? end_time;

  TimetableModel({
    this.uid,
    this.subject,
    this.start_time,
    this.end_time,
  });

  //reciving data from server
  factory TimetableModel.fromMap(map) {
    return TimetableModel(
      uid: map['uid'],
      subject: map['subject'],
      start_time: map['start_time'],
      end_time: map['end_time'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'subject': subject,
      'start_time': start_time,
      'end_time': end_time,
    };
  }
}

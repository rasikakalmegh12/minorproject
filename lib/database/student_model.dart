class StudentModel {
  String? uid;
  String? email;
  String? fullname;
  String? address;
  String? username;
  String? gender, phone, enroll, dob, stdclass;
  StudentModel(
      {this.uid,
      this.email,
      this.fullname,
      this.phone,
      this.dob,
      this.gender,
      this.stdclass,
      this.username,
      this.enroll,
      this.address});

  //reciving data from server
  factory StudentModel.fromMap(map) {
    return StudentModel(
        uid: map['uid'],
        email: map['email'],
        fullname: map['fullname'],
        phone: map['phone'],
        gender: map['gender'],
        username: map['username'],
        dob: map['dob'],
        address: map['address'],
        stdclass: map['class'],
        enroll: map['enroll']);
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullname': fullname,
      'phone': phone,
      'class': stdclass,
      'gender': gender,
      'enroll': enroll,
      'address': address,
      'username': username,
      'dob': dob,
    };
  }
}

class StudentModel {
  String? uid;
  String? email;
  String? fullname;
  String? address;
  String? username;
  String? gender,
      phone,
      enroll,
      dob,
      stdclass,
      religion,
      category,
      caste,
      nationality;
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
      this.address,
      this.religion,
      this.category,
      this.caste,
      this.nationality});

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
        enroll: map['enroll'],
        religion: map['religion'],
        category: map['category'],
        caste: map['caste'],
        nationality: map['nationality']);
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
      'religion': religion,
      'category': category,
      'caste': caste,
      'nationality': nationality,
    };
  }
}

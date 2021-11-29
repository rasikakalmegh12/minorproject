class TeacherModel {
  String? uid;
  String? email;
  String? name;
  String? address;
  String? tid;
  String? gender, phone, qualification;
  TeacherModel(
      {this.uid,
      this.email,
      this.name,
      this.phone,
      this.qualification,
      this.gender,
      this.tid,
      this.address});

  //reciving data from server
  factory TeacherModel.fromMap(map) {
    return TeacherModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      phone: map['phone'],
      gender: map['gender'],
      tid: map['tid'],
      qualification: map['qualification'],
      address: map['address'],
    );
  }

  //sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'phone': phone,
      'qualification': qualification,
      'gender': gender,
      'address': address,
      'tid': tid,
    };
  }
}

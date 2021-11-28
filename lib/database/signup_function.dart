//Student Registration function
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/student_model.dart';
import 'package:schoolsys/login.dart';

void studentRegistration(String fullname, String email, String password,
    BuildContext context) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    postDetailsToFirestore(fullname, context);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email Already in use'),
        ),
      );
    }
  }
}

postDetailsToFirestore(String name, BuildContext context) async {
  // calling firestore
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  StudentModel studentModel = StudentModel();
  studentModel.uid = user!.uid;
  studentModel.email = user.email;
  studentModel.fullname = name;

  await firebaseFirestore
      .collection("students")
      .doc(user.uid)
      .set(studentModel.toMap());

  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    content: Text('Account Created succesfully'),
  ));

  Navigator.pushAndRemoveUntil((context),
      MaterialPageRoute(builder: (context) => const Login()), (route) => false);
}

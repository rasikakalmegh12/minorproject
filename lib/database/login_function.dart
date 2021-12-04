import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/login.dart';
import 'package:schoolsys/studenthome/stdhome.dart';
import 'package:schoolsys/teacher_home/teachers_home.dart';

//login function
void loginWithEmail(String email, String password, BuildContext context,
    String loginType) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((uid) => {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Login Successful'),
              )),
              if (loginType == 'Student')
                {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => StdHome()))
                },
              if (loginType == 'Teacher')
                {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TeacherHome()))
                }
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No user found with that email.'),
        ),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Wrong Password. Try again.'),
        ),
      );
    } else if (e.code == 'network-request-failed') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Poor Internet Connection. Try again.'),
        ),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Error occurred while signing in. Try again.'),
      ),
    );
  }
}

// Change Password Function
void changePassword(String email, String currentPassword, String newPassword,
    BuildContext context) async {
  final user = await FirebaseAuth.instance.currentUser;
  final cred =
      EmailAuthProvider.credential(email: email, password: currentPassword);

  user!.reauthenticateWithCredential(cred).then((value) {
    user.updatePassword(newPassword).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (contex) => const Login()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Password Changed Successfully'),
      ));
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error Occured :${error.toString()}'),
      ));
    });
  }).catchError((err) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(err.toString()),
    ));
  });
}

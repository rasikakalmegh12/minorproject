import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Mohini extends StatefulWidget {
  const Mohini({Key? key}) : super(key: key);

  @override
  _MohiniState createState() => _MohiniState();
}

class _MohiniState extends State<Mohini> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ContactUs(
        cardColor: Colors.blue.shade200,
        textColor: Colors.black,
        taglineColor: Colors.black,
        companyName: 'Mohini Gaikwad',
        companyColor: Colors.black,
        logo: const AssetImage('assets/Mohini.jpeg'),
        email: 'mohinigaikwad913@gmail.com',
        phoneNumber: '+917499478833',
        dividerThickness: 2,
        githubUserName: '',
        linkedinURL: 'https://www.linkedin.com/in/manisha-gaikwad-621012220/',
        tagLine: 'Flutter Developer',
        instagram: 'Gaikwad_Mani',
      ),
    );
  }
}

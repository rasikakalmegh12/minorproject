import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

class Mani extends StatefulWidget {
  const Mani({Key? key}) : super(key: key);

  @override
  _ManiState createState() => _ManiState();
}

class _ManiState extends State<Mani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ContactUs(
        cardColor: Colors.blue.shade200,
        textColor: Colors.black,
        taglineColor: Colors.black,
        companyName: 'Manisha Gaikwad',
        companyColor: Colors.black,
        logo: const AssetImage('assets/Mani.jpg'),
        email: 'gaikwadanisha4444@gmail.com',
        phoneNumber: '+919156744441',
        dividerThickness: 2,
        githubUserName: 'Manisha91567',
        linkedinURL: 'https://www.linkedin.com/in/manisha-gaikwad-621012220/',
        tagLine: 'Flutter Developer',
        instagram: 'Gaikwad_Mani',
      ),
    );
  }
}

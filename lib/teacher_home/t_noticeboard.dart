import 'package:flutter/material.dart';
import 'package:schoolsys/teacher_drawer/tdrawer.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Notice_Teacher extends StatefulWidget {
  const Notice_Teacher({Key? key}) : super(key: key);

  @override
  _Notice_TeacherState createState() => _Notice_TeacherState();
}

class _Notice_TeacherState extends State<Notice_Teacher> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController events = TextEditingController();

  final FocusNode myFocusNode = FocusNode();
  late File imageFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notice Board')),
      drawer: const MyDrawer1(),
      body: Container(
        color: Colors.white,
        child: ListView(children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const <Widget>[
                          Text(
                            'Exam Time Table',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      //Profile pic
                      Container(
                        height: 170.0,
                        color: Colors.white,
                        child: Column(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child:
                                Stack(fit: StackFit.loose, children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      width: 140.0,
                                      height: 140.0,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: ExactAssetImage(
                                              'assets/user.png'),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 90.0, right: 100.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CircleAvatar(
                                      backgroundColor: Colors.blue,
                                      radius: 25.0,
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          _getFromGallery();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 130.0,
                                height: 50.0,
                                child:
                                    // ignore: deprecated_member_use
                                    RaisedButton(
                                  child: const Text("Insert"),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 50.0, right: 100.0),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Events',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            TextFormField(
                              controller: events,
                              onSaved: (value) {
                                events.text = value!;
                              },
                              validator: (value) {
                                RegExp regex =
                                    RegExp(r"^(?=.*[a-z])(?=.*[A-Z]).{3,50}$");

                                if (value!.isEmpty) {
                                  return ("Enter Your Text");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Text");
                                }
                              },
                              decoration: InputDecoration(
                                hintText: 'Events',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            // ignore: deprecated_member_use
                            const Padding(
                              padding: EdgeInsets.only(top: 10.0, right: 500.0),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 130.0,
                                      height: 50.0,
                                      child:
                                          // ignore: deprecated_member_use
                                          RaisedButton(
                                        child: const Text("Add"),
                                        textColor: Colors.white,
                                        color: Colors.blue,
                                        onPressed: () {},
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                      )),
                                ],
                              ),
                            ),
                          ]),
                    ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

_getFromGallery() async {
  // ignore: deprecated_member_use
  PickedFile? pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
  if (pickedFile != null) {
    setState(() {
      var imageFile = File(pickedFile.path);
    });
  }
}

void setState(Null Function() param0) {}

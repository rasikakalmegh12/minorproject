import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:schoolsys/drawer/drawer.dart';

class Notice_Student extends StatefulWidget {
  const Notice_Student({Key? key}) : super(key: key);

  @override
  _Notice_StudentState createState() => _Notice_StudentState();
}

class _Notice_StudentState extends State<Notice_Student> {
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
      drawer: const MyDrawer(),
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
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              'Events',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
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
                            RaisedButton(
                              child: const Text('Add'),
                              color: Colors.blue.shade600,
                              onPressed: () {},
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

// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolsys/database/teacher_model.dart';
import 'package:schoolsys/database/timetable_insertion.dart';
import 'package:schoolsys/teacher_drawer/tdrawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';

class TTimetable extends StatelessWidget {
  const TTimetable({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'TimeTable';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        drawer: const MyDrawer1(),
        body: const LoadDataFromFireStore(),
      ),
    );
  }
}

class LoadDataFromFireStore extends StatefulWidget {
  const LoadDataFromFireStore({Key? key}) : super(key: key);

  @override
  LoadDataFromFireStoreState createState() => LoadDataFromFireStoreState();
}

class LoadDataFromFireStoreState extends State<LoadDataFromFireStore> {
  final _formKey = GlobalKey<FormState>();
  List<Color> _colorCollection = <Color>[];
  MeetingDataSource? events;
  final TextEditingController subject = TextEditingController();
  final TextEditingController date = TextEditingController();
  final TextEditingController start_time = TextEditingController();
  final TextEditingController end_time = TextEditingController();
  final databaseReference = FirebaseFirestore.instance;

  @override
  void initState() {
    _initializeEventColor();
    getDataFromFireStore().then((results) {
      SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
        setState(() {});
      });
    });
    super.initState();
  }

  Future<void> getDataFromFireStore() async {
    var snapShotsValue = await databaseReference.collection("timetable").get();

    final Random random = new Random();
    List<Meeting> list = snapShotsValue.docs
        .map((e) => Meeting(
            eventName: e.data()['subject'],
            from:
                DateFormat('dd/MM/yyyy HH:mm:ss').parse(e.data()['start_time']),
            to: DateFormat('dd/MM/yyyy HH:mm:ss').parse(e.data()['end_time']),
            background: _colorCollection[random.nextInt(9)],
            isAllDay: false))
        .toList();
    setState(() {
      events = MeetingDataSource(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Material(
                        color: Colors.grey.shade200,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30.0)),
                        elevation: 10,
                        child: SfCalendar(
                          view: CalendarView.week,
                          initialDisplayDate: DateTime(2021, 12, 1, 9, 30, 0),
                          dataSource: events,
                          timeSlotViewSettings: const TimeSlotViewSettings(
                              minimumAppointmentDuration:
                                  Duration(minutes: 30)),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        controller: subject,
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                          labelText: 'Subject Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onSaved: (value) {
                          subject.text = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: date,
                        style: const TextStyle(color: Colors.blue),
                        decoration: InputDecoration(
                          labelText: 'Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onSaved: (value) {
                          date.text = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: TextFormField(
                            controller: start_time,
                            style: const TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              labelText: 'Start Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onSaved: (value) {
                              start_time.text = value!;
                            },
                          )),
                          const SizedBox(
                            width: 17,
                          ),
                          Expanded(
                              child: TextFormField(
                            controller: end_time,
                            style: const TextStyle(color: Colors.blue),
                            decoration: InputDecoration(
                              labelText: 'End Time',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onSaved: (value) {
                              end_time.text = value!;
                            },
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                  child: const Text("Add"),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: () {
                                    var finalStartDate =
                                        '${date.text}' ' ' '${start_time.text}';
                                    var finalEndDate =
                                        '${date.text}' ' ' '${end_time.text}';
                                    timetableInsertion(subject.text,
                                        finalStartDate, finalEndDate, context);
                                    // databaseReference
                                    //     .collection(
                                    //         "CalendarAppointmentCollection")
                                    //     .doc("1")
                                    //     .set({
                                    //   'Subject': subject.text,
                                    //   'StartTime': '${date.text}'
                                    //       ' '
                                    //       '${start_time.text}',
                                    //   'EndTime': '${date.text}'
                                    //       ' '
                                    //       '${end_time.text}'
                                    // });
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )),
                              ),
                              flex: 2,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                    // ignore: deprecated_member_use
                                    child: RaisedButton(
                                  child: const Text("Delete"),
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  onPressed: () async {
                                    User? user =
                                        FirebaseAuth.instance.currentUser;
                                    try {
                                      await databaseReference
                                          .collection('timetable')
                                          .doc(user!.uid)
                                          .delete();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Subject deleted successfully'),
                                        ),
                                      );
                                    } catch (e) {}
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )),
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.0),
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
                                  child: const Text("Update"),
                                  textColor: Colors.white,
                                  color: Colors.red,
                                  onPressed: () {
                                    try {
                                      databaseReference
                                          .collection('teacher')
                                          .doc('1')
                                          .update({'Subject': subject.text});
                                    } catch (e) {}
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
      // body: Align(
      //   alignment: Alignment.topCenter,
      //   child: LayoutBuilder(
      //     builder: (BuildContext context, BoxConstraints constraints) {
      //       return Container(
      //           height: constraints.maxHeight / 2,
      //           color: Colors.red,
      //           child: SfCalendar(
      //             view: CalendarView.week,
      //             initialDisplayDate: DateTime(2021, 12, 1, 9, 30, 0),
      //             dataSource: events,
      //             timeSlotViewSettings: const TimeSlotViewSettings(
      //                 minimumAppointmentDuration: Duration(minutes: 30)),

      //             // monthViewSettings: MonthViewSettings(
      //             //   showAgenda: true,
      //             // ),
      //           ));
      //     },
      //   ),
      // ),
    );
  }

  void _initializeEventColor() {
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    _colorCollection.add(const Color(0xFF01A1EF));
    _colorCollection.add(const Color(0xFF3D4FB5));
    _colorCollection.add(const Color(0xFFE47C73));
    _colorCollection.add(const Color(0xFF636363));
    _colorCollection.add(const Color(0xFF0A8043));
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }
}

class Meeting {
  String? eventName;
  DateTime? from;
  DateTime? to;
  Color? background;
  bool? isAllDay;

  Meeting({this.eventName, this.from, this.to, this.background, this.isAllDay});
}

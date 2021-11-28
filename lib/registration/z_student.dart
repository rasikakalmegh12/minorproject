import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:schoolsys/login.dart';
import 'package:schoolsys/registration/student_registration.dart';
import 'package:intl/intl.dart';

class Student extends StatelessWidget {
  const Student({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Student Registration';
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
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class. This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController stdName = TextEditingController();
  final TextEditingController stdEnroll = TextEditingController();
  final TextEditingController stdClass = TextEditingController();
  final TextEditingController stdEmail = TextEditingController();
  final TextEditingController stdPhone = TextEditingController();
  final TextEditingController stdGender = TextEditingController();
  final TextEditingController stdAddress = TextEditingController();
  final TextEditingController intialdateval = TextEditingController();
  final TextEditingController username = TextEditingController();
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: sized_box_for_whitespace, avoid_unnecessary_containers
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15.0,
                    ),
                    TextFormField(
                      controller: username,
                      onSaved: (value) {
                        username.text = value!;
                      },
                      validator: (value) {
                        RegExp regex =
                            RegExp(r"^[a-zA-Z0-9]+([._]?[a-zA-Z0-9]+)*$");

                        if (value!.isEmpty) {
                          return ("Enter Username");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Username ");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        labelText: 'User Name',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: stdName,
                      onSaved: (value) {
                        stdName.text = value!;
                      },
                      validator: (value) {
                        RegExp regex =
                            RegExp(r"^(?=.*[a-z])(?=.*[A-Z]).{3,50}$");

                        if (value!.isEmpty) {
                          return ("Enter Your Name");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Name");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        labelText: 'Fullname',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),

                    //Delete
                    TextFormField(
                      controller: stdEnroll,
                      onSaved: (value) {
                        stdEnroll.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z0-9]*$");

                        if (value!.isEmpty) {
                          return ("Enter Your Enrollment Number");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Enrollment Number");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Enrollment Number',
                        labelText: 'Enrollment Number',
                        suffixIcon: const Icon(Icons.format_list_numbered),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdClass,
                      onSaved: (value) {
                        stdClass.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[a-zA-Z ]*$");

                        if (value!.isEmpty) {
                          return ("Enter Your Class");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Class ");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter class',
                        labelText: 'Class',
                        suffixIcon: const Icon(Icons.class_),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdEmail,
                      onSaved: (value) {
                        stdEmail.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Your Email!");
                        }
                        if (!RegExp(
                                r"^[_A-Za-z0-9-\+]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9]+)*(\.[A-Za-z]{2,})$")
                            .hasMatch(value)) {
                          return ("Enter A Valid Email");
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        labelText: 'Email',
                        suffixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdPhone,
                      onSaved: (value) {
                        stdPhone.text = value!;
                      },
                      validator: (value) {
                        RegExp regex = RegExp(r"^[0-9]*$");

                        if (value!.isEmpty) {
                          return ("Enter Phone Number");
                        }
                        if (value.length < 10) {
                          return ("Phone number consist 10 digits!");
                        }
                        if (value.length > 10) {
                          return ("Phone number cannot be greater than 10 digits");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Phone Number");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your phone number',
                        labelText: 'Phone number',
                        suffixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      controller: intialdateval,
                      decoration: InputDecoration(
                        labelText: 'DOB',
                        suffixIcon: const Icon(Icons.calendar_today),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onSaved: (value) {
                        intialdateval.text = value!;
                      },
                      onTap: () {
                        _selectDate();
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      maxLines: 1,
                      validator: (value) {
                        if (value!.isEmpty || value.isEmpty) {
                          return 'Choose Date';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdGender,
                      onSaved: (value) {
                        stdGender.text = value!;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ("Enter Gender");
                        }
                        if (value != "Male" && value != "Female") {
                          return ("Enter Valid Gender");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Male Female',
                        labelText: 'Gender',
                        suffixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      controller: stdAddress,
                      onSaved: (value) {
                        stdAddress.text = value!;
                      },
                      validator: (value) {
                        RegExp regex =
                            RegExp(r"^([a-zA-z0-9/\\''(),-\s]{2,255})$");

                        if (value!.isEmpty) {
                          return ("Enter Your Address");
                        }
                        if (!regex.hasMatch(value)) {
                          return ("Enter Valid Address ");
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Address',
                        labelText: 'Address',
                        suffixIcon: const Icon(Icons.home),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: deprecated_member_use
                          RaisedButton(
                            child: const Text('Next'),
                            color: Colors.blue.shade600,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Student1()));
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));
    if (picked != null) {
      setState(() => {intialdateval.text = dateFormat.format(picked)});
    }
  }
}

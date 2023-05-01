import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarship_vjti/Authentication/login.dart';
import 'package:scholarship_vjti/widgets/sizedbox.dart';

import '../widgets/myDropDown.dart';
import '../widgets/textField.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController studentName = TextEditingController();

  TextEditingController mobileNo = TextEditingController();

  TextEditingController registrationID = TextEditingController();

  TextEditingController emailID = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController course = TextEditingController();
  //department
  TextEditingController branch = TextEditingController();
  //branch

  TextEditingController caste_info = TextEditingController();

  TextEditingController income = TextEditingController();

  late Map<String, dynamic> studtoadd;

  final _formKey = GlobalKey<FormState>();

  CollectionReference ref = FirebaseFirestore.instance.collection('Users');

  final List<String> department = [
    "Master",
    "M.Tech",
    "Degree",
    "Diploma",
  ];

  final List<String> brachName = [
    "Computer Science",
    "Information Technology",
    "EXTC",
    "Electronics",
    "Electrical",
    "Mechanical",
    "Producation",
    "Textile",
    "Civil",
    "Chemical",
    "Master I Computer Application ",
    "Master in Machine Design ",
    "Master in Software Engineering",
  ];
  storeNewUser() async {
    var FirebaseUser = await FirebaseAuth.instance.currentUser!;
    FirebaseFirestore.instance
        .collection('student')
        .doc(FirebaseUser.uid)
        .set({
          'email': emailID.text,
          "password": password.text,
          "uid": FirebaseUser.uid,
          'studentName': studentName.text,
          'mobileNo': mobileNo.text,
          'registrationID': registrationID.text,
          'course': course.text,
          'branch': branch.text,
        })
        .then((value) => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage())))
        .catchError((e) {
          print(e);
        });
  }

  // addStudent() {
  //   studtoadd = {
  //     'studentName': studentName.text,
  //     'mobileNo': mobileNo.text,
  //     'registrationID': registrationID.text,
  //     'emailID': emailID.text,
  //     'course': course.text,
  //     'branch': branch.text,
  //   };

  //   ref
  //       .doc(registrationID.text)
  //       .set(studtoadd)
  //       .whenComplete(() => print("added"));
  // }

  // late String _email;
  // late String _password;
  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "REGISTER HERE",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      myTextField(
                        controller: studentName,
                        hintTxt: "Enter Name as per Adhar Card",
                        labelTxt: "Name",
                        myIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Name as per Adhar Card';
                          }
                          return null;
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: mobileNo,
                        hintTxt: "Enter Mobile No. linked with Maha DBT",
                        labelTxt: "Mobile no.",
                        myIcon: Icon(
                          Icons.phone,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter phone No. linked with Maha DBT';
                          } else if (value.length != 10) {
                            return 'Enter 10 digit phone no.';
                          }
                          return null;
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: registrationID,
                        hintTxt: "Enter College Registration ID",
                        labelTxt: "Registartion ID",
                        myIcon: Icon(
                          Icons.account_circle,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Registration ID';
                          } else if (value.length != 9) {
                            return 'Enter 10 digit registration no.';
                          }
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: caste_info,
                        hintTxt: "Enter Your Caste",
                        labelTxt: "Caste",
                        myIcon: Icon(
                          Icons.person,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your caste';
                          }
                          return null;
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: income,
                        hintTxt: "Enter your family income",
                        labelTxt: "Family Income",
                        myIcon: Icon(
                          Icons.currency_rupee,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.phone,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'please Enter your family income';
                          }
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: emailID,
                        hintTxt: "Enter College Email id",
                        labelTxt: "Email id",
                        myIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email id';
                          }
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myTextField(
                        controller: password,
                        hintTxt: "Enter Password",
                        labelTxt: "Password",
                        myIcon: Icon(
                          Icons.password_sharp,
                          color: Color.fromARGB(255, 97, 49, 218),
                        ),
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.length < 6) {
                            return 'Enter Strong Password';
                          }
                        },
                      ),
                      mySizedbox(num1: 0.025),
                      myDropDown(
                        controller: course,
                        items: department,
                        title: 'Department',
                      ),
                      mySizedbox(num1: 0.025),
                      myDropDown(
                        controller: branch,
                        items: brachName,
                        title: 'branch',
                      ),
                    ],
                  ),
                ),
                mySizedbox(num1: 0.03),
                MaterialButton(
                  height: 50,
                  minWidth: MediaQuery.of(context).size.width / 2,
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: emailID.text, password: password.text)
                          .then((signedInUser) {
                        storeNewUser();

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Submitted Data')),
                        );

                        Timer(Duration(seconds: 3), () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        });
                      }).catchError((e) {
                        print(e);
                      });
                    } else {
                      print("Not");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Please fill all the fields')),
                      );
                    }
                  },
                  color: Color.fromARGB(255, 97, 49, 218),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Color.fromARGB(255, 97, 49, 218),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     Timer(Duration(seconds: 0), () {
                //       Navigator.pushReplacement(context,
                //           MaterialPageRoute(builder: (context) => LoginPage()));
                //     });
                //   },
                //   child: Text('next'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

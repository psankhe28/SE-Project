import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/AllSchemes/schemes.dart';
import 'package:scholarship_vjti/main.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/textField.dart';
import '../widgets/myButton.dart';
import '../widgets/myDropDown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class second extends StatefulWidget {
  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  @override
  void initState() {
    // getData();
    super.initState();
  }

  FirebaseAuth _auth = FirebaseAuth.instance;

  // void getData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     registrationID =
  //         prefs.getString('registrationID') as TextEditingController;
  //   });
  // }

  void _processData() {
    // Process your data and upload to server
    _formKey.currentState?.reset();
  }

  final List<String> schemeName = [
    "Rajarshi Chatrapati Shahu Maharaj Shikshan Shulka Shishyavrutti Yoja (EBC)",
    "Dr. Panjabrao Deshmukh Vastigruh Nirvah Bhatta Yojna[DTE]",
    "Scholarship for students of minority communities pursuing Higher and Professional courses[DTE]",
    "Government of India Post-Metric Scholarship",
    "Post-Matric Tuition Fees and Examination Fees (Freeship)",
    "Post-Matric Scholarship Scheme (Government of India)",
    "(Vocational Education Fee Reimbursement)",
    "Post Matric Scholarship to OBC Students",
    "Post Matric Scholarship to SBC Students",
    "Post Matric Scholarship to VJNT Students",
    "Tuition Fee & Examination Fees to OBC Students",
    "Tuition Fee & Examination Fees to SBC Students",
    "Tuition Fee & Examination Fees to VJNT Students",
    "Post Matric Scholarship for person with disability",
    "Assistance to Meritorious Students scholarhip - Senior Level",
  ];

  final List<String> caste = [
    "Open",
    "SEBC",
    "EWS",
    "Minority(Muslim, Sikh, Christian, Buddhist, Parsi, Jain and Jew)",
    "SC",
    "ST",
    "OBC",
    "SBC",
    "VJNT",
    "Only Physically Handicapped",
    "AMS Students",
  ];

  final List<String> fyear = [
    "2018-19",
    "2019-20",
    "2022",
  ];

  @override
  TextEditingController registrationID = TextEditingController();

  // TextEditingController caste_info = TextEditingController();

  // TextEditingController income = TextEditingController();

  TextEditingController appliedScheme = TextEditingController();

  TextEditingController scholarshipID = TextEditingController();

  TextEditingController financialYear = TextEditingController();

  late Map<String, dynamic> studentToAdd;

  final _formKey = GlobalKey<FormState>();

  CollectionReference collectionReference1 =
      FirebaseFirestore.instance.collection('student');
  addStudent() {
    studentToAdd = {
      // 'caste_info': caste_info.text,
      'appliedScheme': appliedScheme.text,
      'scholarshipID': scholarshipID.text,
      'financialYear': financialYear.text,
      // 'Income': income.text,
    };
    print(_auth.currentUser!.uid);

    collectionReference1
        .doc(_auth.currentUser!.uid)
        .collection('scholarship')
        .doc(scholarshipID.text)
        .set(studentToAdd)
        .whenComplete(() => print("added"));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Applied ScholarShip Information"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 20),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    myTextField(
                      controller: scholarshipID,
                      hintTxt: "Enter Scholarship ID",
                      labelTxt: "Enter Scholarship ID",
                      myIcon: Icon(
                        Icons.card_membership,
                        color: Color.fromARGB(255, 97, 49, 218),
                      ),
                      textInputType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Scholarship ID";
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    myDropDown(
                      controller: financialYear,
                      items: schemeName,
                      title: 'Scheme Name',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    myDropDown(
                      controller: appliedScheme,
                      items: fyear,
                      title: 'Financial Year',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
              MaterialButton(
                height: 50,
                minWidth: MediaQuery.of(context).size.width / 2,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  } else {
                    print("Not");
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Not Submitted Data')),
                    );
                  }

                  addStudent();

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Submitted Data')),
                  );
                  _processData();
                },
                color: Color.fromARGB(255, 97, 49, 218),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 97, 49, 218),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

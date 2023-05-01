// import 'dart:async';
// import 'package:animate_do/animate_do.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:scholarship_vjti/widgets/myAppBar.dart';
// import 'package:scholarship_vjti/widgets/textField.dart';
// import '../widgets/myButton.dart';
// import '../widgets/myDropDown.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'form2.dart';

// class form1 extends StatelessWidget {
//   @override
//   TextEditingController studentName = TextEditingController();

//   TextEditingController mobileNo = TextEditingController();

//   TextEditingController registrationID = TextEditingController();

//   TextEditingController emailID = TextEditingController();

//   TextEditingController course = TextEditingController();
//   //department
//   TextEditingController branch = TextEditingController();
//   //branch

//   late Map<String, dynamic> studtoadd;

//   final _formKey = GlobalKey<FormState>();

//   CollectionReference ref = FirebaseFirestore.instance.collection('Users');

//   final List<String> department = [
//     "Master",
//     "M.Tech",
//     "Degree",
//     "Diploma",
//   ];

//   final List<String> brachName = [
//     "Computer Science",
//     "Information Technology",
//     "EXTC",
//     "Electronics",
//     "Electrical",
//     "Mechanical",
//     "Producation",
//     "Textile",
//     "Civil",
//     "Chemical",
//     "Master I Computer Application ",
//     "Master in Machine Design ",
//     "Master in Software Engineering",
//   ];

//   addStudent() {
//     studtoadd = {
//       'studentName': studentName.text,
//       'mobileNo': mobileNo.text,
//       'registrationID': registrationID.text,
//       'emailID': emailID.text,
//       'course': course.text,
//       'branch': branch.text,
//     };

//     ref
//         .doc(registrationID.text)
//         .set(studtoadd)
//         .whenComplete(() => print("added"));
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(title: "Personal Information"),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: Container(
//           height: double.infinity,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myTextField(
//                         controller: studentName,
//                         hintTxt: "Enter Name as per Adhar Card",
//                         labelTxt: "Name",
//                         myIcon: Icon(
//                           Icons.person,
//                           color: Color.fromARGB(255, 97, 49, 218),
//                         ),
//                         textInputType: TextInputType.text,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Name as per Adhar Card';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myTextField(
//                         controller: mobileNo,
//                         hintTxt: "Enter Mobile No. linked with Maha DBT",
//                         labelTxt: "Mobile no.",
//                         myIcon: Icon(
//                           Icons.phone,
//                           color: Color.fromARGB(255, 97, 49, 218),
//                         ),
//                         textInputType: TextInputType.phone,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter phone No. linked with Maha DBT';
//                           } else if (value.length != 10) {
//                             return 'Enter 10 digit phone no.';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myTextField(
//                         controller: registrationID,
//                         hintTxt: "Enter College Registration ID",
//                         labelTxt: "Registartion ID",
//                         myIcon: Icon(
//                           Icons.account_circle,
//                           color: Color.fromARGB(255, 97, 49, 218),
//                         ),
//                         textInputType: TextInputType.number,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Registration ID';
//                           } else if (value.length != 9) {
//                             return 'Enter 10 digit registration no.';
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myTextField(
//                         controller: emailID,
//                         hintTxt: "Enter College Email id",
//                         labelTxt: "Email id",
//                         myIcon: Icon(
//                           Icons.email,
//                           color: Color.fromARGB(255, 97, 49, 218),
//                         ),
//                         textInputType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return 'Enter Email id';
//                           }
//                         },
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myDropDown(
//                         controller: course,
//                         items: department,
//                         title: 'Department',
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       myDropDown(
//                         controller: branch,
//                         items: brachName,
//                         title: 'branch',
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),
//                 MaterialButton(
//                   height: 50,
//                   minWidth: MediaQuery.of(context).size.width / 2,
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Processing Data')),
//                       );
//                     } else {
//                       print("Not");
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('Not Submitted Data')),
//                       );
//                     }
//                     addStudent();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Submitted Data')),
//                     );
//                     Timer(Duration(seconds: 4), () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder: (context) => second()));
//                     });
//                   },
//                   color: Color.fromARGB(255, 97, 49, 218),
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(
//                       color: Color.fromARGB(255, 97, 49, 218),
//                     ),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(
//                     "Next",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18),
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Timer(Duration(seconds: 0), () {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => second()));
//                     });
//                   },
//                   child: Text('next'),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

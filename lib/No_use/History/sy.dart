// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';

// import '../../widgets/textField.dart';

// class sy extends StatefulWidget {
//   const sy({super.key});

//   @override
//   State<sy> createState() => _syState();
// }

// class _syState extends State<sy> {
//   final _formKey = GlobalKey<FormState>();

//   TextEditingController regID = TextEditingController();
//   TextEditingController SchemeName = TextEditingController();
//   TextEditingController sid = TextEditingController();
//   TextEditingController fyear = TextEditingController();
//   TextEditingController caste = TextEditingController();
//   late Map<String, dynamic> studentToAdd;
//   CollectionReference collectionReference1 =
//       FirebaseFirestore.instance.collection('Users');
//   addStudent() {
//     studentToAdd = {
//       "SchemeName": SchemeName.text,
//       "sid": sid.text,
//       "caste": caste.text,
//       "fyear": fyear.text,
//     };

//     collectionReference1.doc(regID.text).collection('scholarship')
//       ..add((studentToAdd)).whenComplete(() => print("added"));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 myTextField(
//                   controller: regID,
//                   hintTxt: "Enter Registration ID",
//                   labelTxt: "Registration no.",
//                   myIcon: Icon(Icons.phone),
//                   textInputType: TextInputType.text,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter Registration no.';
//                     } else if (value.length != 10) {
//                       return 'Enter 9 digit Registration no.';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 myTextField(
//                   controller: sid,
//                   hintTxt: "Enter Scholarship ID",
//                   labelTxt: "Scholarship no.",
//                   myIcon: Icon(Icons.phone),
//                   textInputType: TextInputType.text,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter phone no.';
//                     } else if (value.length != 10) {
//                       return 'Enter 10 digit phone no.';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 myTextField(
//                   controller: SchemeName,
//                   hintTxt: "Enter Scheme Name",
//                   labelTxt: " Scheme Name",
//                   myIcon: Icon(Icons.numbers),
//                   textInputType: TextInputType.number,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter Scheme name';
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 myTextField(
//                   controller: fyear,
//                   hintTxt: "Enter financial year",
//                   labelTxt: " financial year",
//                   myIcon: Icon(Icons.numbers),
//                   textInputType: TextInputType.number,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter financial year';
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 myTextField(
//                   controller: caste,
//                   hintTxt: "Enter your caste ",
//                   labelTxt: "Caste",
//                   myIcon: Icon(Icons.money),
//                   textInputType: TextInputType.number,
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return 'Enter your Caste';
//                     }
//                   },
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 MaterialButton(
//                   height: 50,
//                   minWidth: double.infinity,
//                   onPressed: () {
//                     addStudent();
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       const SnackBar(content: Text('Submitted Data')),
//                     );
//                   },
//                   color:Color.fromARGB(255, 97, 49, 218),
//                   shape: RoundedRectangleBorder(
//                     side: const BorderSide(color:Color.fromARGB(255, 97, 49, 218),),
//                     borderRadius: BorderRadius.circular(50),
//                   ),
//                   child: Text(
//                     "Submit",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 18),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

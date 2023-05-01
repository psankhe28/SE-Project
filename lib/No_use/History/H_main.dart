// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:scholarship_vjti/Activity_Status/History/fy.dart';
// import 'package:scholarship_vjti/Activity_Status/History/ly.dart';
// import 'package:scholarship_vjti/Activity_Status/History/sy.dart';
// import 'package:scholarship_vjti/Activity_Status/History/ty.dart';
// import 'package:scholarship_vjti/AllSchemes/schemes.dart';

// class H_main extends StatefulWidget {

 

//   @override
//   State<H_main> createState() => _H_mainState();
// }

// class _H_mainState extends State<H_main> with SingleTickerProviderStateMixin {
//   late TabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(length: 4, vsync: this, initialIndex: 0);
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 91, 85, 177),
//         elevation: 30,
//         title: Center(child: Text("Schemes")),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(30),
//             bottomRight: Radius.circular(30),
//           ),
//         ),
//         bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
//           Tab(text: "1st Year"),
//           Tab(text: "2nd Year"),
//           Tab(text: "3rd Year"),
//           Tab(text: "4th Year"),
//         ]),
//       ),
//       body: TabBarView(
//         controller: _controller,
//         children: <Widget>[Common(), sy(), ty(), ly()],
//       ),
//     );
//   }
// }

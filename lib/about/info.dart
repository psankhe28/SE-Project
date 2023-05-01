// import 'package:flutter/material.dart';

// // class AboutPage extends StatelessWidget {
// //   final List<DeveloperCard> developers = [
// //     DeveloperCard(name: 'Developer 1', image: "assets/images/sanket.jpeg"),
// //     DeveloperCard(name: 'Developer 2', image: 'https://example.com/developer2.jpg'),
// //     DeveloperCard(name: 'Developer 3', image: 'https://example.com/developer3.jpg'),
// //     DeveloperCard(name: 'Developer 4', image: 'https://example.com/developer4.jpg'),
// //     DeveloperCard(name: 'Developer 5', image: 'https://example.com/developer5.jpg'),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             flex: 2,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 image: DecorationImage(
// //                   image: AssetImage("assets/images/about_bg.jpg"),
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: <Widget>[
// //                   SizedBox(height: 50),
// //                   Text("About", style: TextStyle(color: Color.fromARGB(255, 20, 20, 20), fontSize: 30, fontWeight: FontWeight.bold)),
// //                   SizedBox(height: 20),
// //                   Text("Our Team", style: TextStyle(color: Color.fromARGB(255, 22, 22, 22), fontSize: 20)),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             flex: 3,
// //             child: Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
// //               ),
// //               child: Padding(
// //                 padding: EdgeInsets.all(30),
// //                 child: ListView.builder(
// //                   itemCount: developers.length,
// //                   itemBuilder: (BuildContext context, int index) {
// //                     return DeveloperCard(
// //                       name: developers[index].name,
// //                       image : "assets/images/sanket.jpeg",
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class DeveloperCard extends StatelessWidget {
// //   final String name;
// //   final String image;

// //   DeveloperCard({required this.name, required this.image});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: EdgeInsets.all(8),
// //       child: Column(
// //         children: <Widget>[
// //           Container(
// //             width: 150,
// //             height: 150,
// //             decoration: BoxDecoration(
// //               shape: BoxShape.circle,
// //               image: DecorationImage(
// //                 fit: BoxFit.cover,
// //                 image: AssetImage(image),
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 8),
// //           Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
// //         ],
// //       ),
// //     );
// //   }
// // }


// class  AboutPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             flex: 2,
//             child: Container(
//               decoration: BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/images/slider_bg.jpg"),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   SizedBox(height: 50),
//                   Text("Welcome", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
//                   SizedBox(height: 20),
//                   Text("to our app", style: TextStyle(color: Colors.white, fontSize: 20)),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
//               ),
//               child: Padding(
//                 padding: EdgeInsets.all(30),
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   children: <Widget>[
//                     SectionCard(
//                       title: 'Section 1',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                     SectionCard(
//                       title: 'Section 2',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                     SectionCard(
//                       title: 'Section 3',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                     SectionCard(
//                       title: 'Section 4',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                     SectionCard(
//                       title: 'Section 5',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                     SectionCard(
//                       title: 'Section 6',
//                       icon: Icons.security,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SectionCard extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final Function onPressed;

//   SectionCard({required this.title, required this.icon, required this.onPressed});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(
//             icon,
//             size: 50,
//           ),
//           SizedBox(height: 10),
//           Text(
//             title,
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 10),
//           // FlatButton(
//           //   onPressed: onPressed,
//           //   child: Text('Explore'),
//           // ),
//         ],
//       ),
//     );
//   }
// }
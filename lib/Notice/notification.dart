// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:scholarship_vjti/widgets/myAppBar.dart';

// import 'local_notification_service.dart';
// // import 'package:firebase_messaging/firebase_messaging.dart';

// // class MessageScreen extends StatefulWidget {
// //   @override
// //   _MessageScreenState createState() => _MessageScreenState();
// // }

// // class _MessageScreenState extends State<MessageScreen> {
// //   FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
// //   String _message = '';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _firebaseMessaging.getToken().then((token) {
// //       print("Firebase Messaging Token: $token");
// //     });
// //     _firebaseMessaging.subscribeToTopic('all');
// //     FirebaseMessaging.onMessage.listen((message) {
// //       setState(() {
// //          _message = message.notification!.body!;
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: Colors.white,
// //       child: Center(
// //         child: Text(_message , style: TextStyle(color: Colors.black),),
// //       ),
// //     );
// //   }
// // }

// class MessageScreen extends StatefulWidget {
//   const MessageScreen({ Key? key }) : super(key: key);

//   @override
//   _MessageScreenState createState() => _MessageScreenState();
// }

// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   void init(){
//     super.initState() ; 

//     FirebaseMessaging.instance.getInitialMessage().then(
//       (message) {
//         print("FirebaseMessaging.instance.getInitialMessage");
//         if (message != null) {
//           print("New Notification");
//           // if (message.data['_id'] != null) {
//           //   Navigator.of(context).push(
//           //     MaterialPageRoute(
//           //       builder: (context) => DemoScreen(
//           //         id: message.data['_id'],
//           //       ),
//           //     ),
//           //   );
//           // }
//         }
//       },
//     );

//     // 2. This method only call when App in forground it mean app must be opened
//     FirebaseMessaging.onMessage.listen(
//       (message) {
//         print("FirebaseMessaging.onMessage.listen");
//         if (message.notification != null) {
//           print(message.notification!.title);
//           print(message.notification!.body);
//           print("message.data11 ${message.data}");

//         }
//       },
//     );

//     // 3. This method only call when App in background and not terminated(not closed)
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (message) {
//         print("FirebaseMessaging.onMessageOpenedApp.listen");
//         if (message.notification != null) {
//           print(message.notification!.title);
//           print(message.notification!.body);
//           print("message.data22 ${message.data['_id']}");
//         }
//       },
//     );
  
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(title: "Notification"),
      
//     );
//   }
// }
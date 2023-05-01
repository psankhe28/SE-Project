import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_vjti/Authentication/login.dart';
import 'package:scholarship_vjti/download/pdfViewer.dart';

import 'AllSchemes/eligible_Schemes.dart';
import 'Authentication/registartion.dart';
import 'Payment_history/pHistory.dart';
import 'download/x.dart';
import 'download/y.dart';



Future<void> backgroundHandler(RemoteMessage message) async {
  	print(message.data.toString());
 	print(message.notification!.title);
}
// FirebaseMessaging messaging = FirebaseMessaging.instance;
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();

//   print("Handling a background message: ${message.messageId}");
// }

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // LocalNotificationService.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.playfairDisplayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>LoginPage(),
        "/register": (context) => RegisterPage(),
        '/paymentHistory': (context) => paymentHistory(),
        "/MySchemes": (context) => MySchemes(),
      },
    );
  }
}

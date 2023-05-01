import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

class NMain extends StatefulWidget {
  const NMain({Key? key}) : super(key: key);

  @override
  _NMainState createState() => _NMainState();
}

class _NMainState extends State<NMain> {
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return Scaffold(appBar: MyAppBar(title: "Notice Board"), body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: notices(),
    ));
  }

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  String _message = '';

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((token) {
      print("Firebase Messaging Token: $token");
    });
    _firebaseMessaging.subscribeToTopic('all');
    FirebaseMessaging.onMessage.listen((message) {
      setState(() {
         _message = message.notification!.body!;
      });
    });
  }

  Widget notices() {
    return StreamBuilder(
      stream: db.collection("Notification").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final Value = (snapshot.data! as QuerySnapshot).docs;
        return FadeInDown(
          delay: Duration(milliseconds: 800),
          child: Value.length > 0
              ? ListView.builder(
                  itemCount: Value.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10  , right: 10 , top: 7 , bottom: 7),
                            child: index < Value.length ? ListTile(
                                            tileColor: Color.fromARGB(255, 239, 236, 236),
                                            shape: RoundedRectangleBorder(
                                              
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            title:
                                                Text(Value[index]["message"] ,style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                                          ): Container(),
                          ),
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text(
                    "No any notices",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
        );
      },
    );
  }
}

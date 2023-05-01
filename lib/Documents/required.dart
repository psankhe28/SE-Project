import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/widgets/theme.dart';

import '../widgets/myAppBar.dart';

class document extends StatelessWidget {
  // List<String> requiredDocs = <String>[
  //   'Cap allotment letter',
  //   'College fee receipt',
  //   'Marksheet of SSC(10th std)',
  //   'Marksheet of HSC(12th std)',
  //   'Previous Year Marksheet',
  //   'All semester Marksheets',
  //   'Caste Certificate',
  //   'Income Certificate of current financial   year(from Tehsildar)',
  //   'Bank Passbook',
  //   'Self Declaration',
  //   'Domicile Certificate',
  //   'Rashan Card',
  //   'Hostel Certificate(if Required)',
  //   'Gap Certificate(if Required)',
  //   'Handicap Certificate(if Required)',
  // ];
  @override
  FirebaseFirestore db = FirebaseFirestore.instance;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
            appBar: MyAppBar(title: "Required Documents"), body: listview()),
      ),
    );
  }

  Widget listview() {
    // Future<void> _launchUrl(_url) async {
    //   if (!await launchUrl(_url)) {
    //     throw 'Could not launch $_url';
    //   }
    // }
    return StreamBuilder(
      stream: db.collection("documents").snapshots(),
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
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.white, width: 3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              )),
                          child: Text(
                            Value[index]["name"],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  })
              : Center(
                  child: Text(
                    "Products Not Available",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ),
        );
      },
    );
  }
}

class Texttitle extends StatelessWidget {
  Texttitle({required this.title});
  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20.0,
      ),
    );
  }
}

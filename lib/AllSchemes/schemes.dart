import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:scholarship_vjti/widgets/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class schemes extends StatelessWidget {
  String type;
  schemes({
    Key? key,
    required this.type,
  }) : super(key: key);

  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: db.collection("mySchemes").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final Value = (snapshot.data! as QuerySnapshot).docs;
          return FadeInDown(
            delay: Duration(milliseconds: 800),
            child: listview(),
          );
        },
      ),
    );
  }

  Widget listview() {
    Future<void> _launchUrl(_url) async {
      if (!await launchUrl(_url)) {
        throw 'Could not launch $_url';
      }
    }
    return StreamBuilder(
      stream: db.collection("mySchemes").snapshots(),
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
                    if (Value[index]["type"] == type) {
                      return InkWell(
                        onTap: () {
                          Uri _url = Uri.parse(
                              'https://console.firebase.google.com/project/sanket-9dd56/firestore/data/~2FmySchemes~2F91kOfEDEWdbmlGgAEeDl');
                          _launchUrl(_url);
                        },
                        child: Stack(
                          children: <Widget>[
                            Container(
                              margin:
                                  EdgeInsets.only(left: 16, right: 16, top: 16),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.white, width: 3),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  )),
                              child: Text( 
                                Value[index]["name"],
                               style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                      
                    } else {
                      return Container();
                    }
                
                  }
                  
                  )
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

// Widget sankey () {
//     // Future<void> _launchUrl(_url) async {
//     //   if (!await launchUrl(_url)) {
//     //     throw 'Could not launch $_url';
//     //   }
//     // }
//     return StreamBuilder(
//       stream: db.collection("documents").snapshots(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         final Value = (snapshot.data! as QuerySnapshot).docs;
//         return FadeInDown(
//           delay: Duration(milliseconds: 800),
//           child: Value.length > 0
//               ? ListView.builder(
//                   itemCount: Value.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     if (Value[index]["type"] == type) {
//                       return InkWell(
//                         onTap: () {
//                           Uri _url = Uri.parse(
//                               'https://console.firebase.google.com/project/sanket-9dd56/firestore/data/~2FmySchemes~2F91kOfEDEWdbmlGgAEeDl');
//                           _launchUrl(_url);
//                         },
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               margin:
//                                   EdgeInsets.only(left: 16, right: 16, top: 16),
//                               decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border:
//                                       Border.all(color: Colors.white, width: 3),
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(16),
//                                   )),
//                               child: Text( 
//                                 Value[index]["name"],
//                                style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
                      
//                     } else {
//                       return Container();
//                     }
                
//                   }
                  
//                   )
//               : Center(
//                   child: Text(
//                     "Products Not Available",
//                     style: TextStyle(fontSize: 25, color: Colors.green),
//                   ),
//                 ),
//         );
//       },
//     );
//   }
// }





 
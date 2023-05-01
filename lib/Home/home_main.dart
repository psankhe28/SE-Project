import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:scholarship_vjti/Details/form2.dart';
import 'package:scholarship_vjti/Home/slide.dart';
import 'package:scholarship_vjti/Home/slider.dart';
import 'package:scholarship_vjti/Notice/N_main.dart';
import 'package:scholarship_vjti/widgets/marque.dart';
import 'package:scholarship_vjti/widgets/myAppBar.dart';
import '../AllSchemes/tab.dart';
import '../Documents/required.dart';
import '../Notice/notification.dart';
import '../download/pdfViewer.dart';
import '../downloads/download.dart';
import 'drawer.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({Key? key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImageUrls();
  }  
   Future<void> _loadImageUrls() async {
  final storageRef = FirebaseStorage.instance.ref().child("sliderImages");
  final items = await storageRef.listAll();
  print(items);
  for (var item in items.items) {
    try {
      final url = await item.getDownloadURL();
      setState(() {
        _imageUrls.add(url.toString());
        print(_imageUrls);
      });
    } catch (e) {
      print("Error getting URL: $e");
    }
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 97, 49, 218),
        elevation: 30,
        title: Text("Scholarship"),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NMain(),
                    ));
              },
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: RefreshIndicator(
        onRefresh: () async{ await _loadImageUrls(); },
        child: FadeInDownBig(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Marque(),
                  SizedBox(
                    height: 10,
                  ),
                  slider(imageUrls: _imageUrls,),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => second(),
                                    ),
                                  );
                                },
                                child: column("assets/images/history.png",
                                    "Registration", context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => main_activity(),
                                    ),
                                  );
                                },
                                child: column("assets/images/diagram.png",
                                    "All Schemes", context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                child: column(
                                    "assets/images/form.png", "Forms", context),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MainPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/paymentHistory');
                                },
                                child: column("assets/images/history_icon.png",
                                    "Payment", context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, "/MySchemes");
                                },
                                child: column("assets/images/planning.png",
                                    "MySchemes", context),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => document(),
                                    ),
                                  );
                                },
                                child: column("assets/images/paper.png",
                                    "Documents", context),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget column(String image, String text, BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width / 2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(image: AssetImage(image))),
          ),
          SizedBox(
            height: 3,
          ),
          // Container(
          //   margin:
          //       const EsssdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
          //   width: MediaQuery.of(context).size.width / 4,
          //   height: 80,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(20),
          //     image: DecorationImage(
          //         image: AssetImage(image), fit: BoxFit.contain),
          //   ),
          // ),
          Text(
            text,
            style: const TextStyle(
                color: Color.fromARGB(255, 76, 76, 175),
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
        ],
      ),
    );
  }
}

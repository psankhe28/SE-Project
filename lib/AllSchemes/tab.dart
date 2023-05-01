import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:scholarship_vjti/AllSchemes/schemes.dart';


class main_activity extends StatefulWidget {

  main_activity({Key? key,}) : super(key: key);

  @override
  State<main_activity> createState() => _main_activityState();
}

class _main_activityState extends State<main_activity> with SingleTickerProviderStateMixin {
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 91, 85, 177),
        elevation: 30,
        title: Center(child: Text("Schemes")),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        bottom: TabBar(isScrollable: true, controller: _controller, tabs: [
          Tab(text: " State"),
          Tab(text: "Central"),
          Tab(text: "institute"),
        ]),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          schemes(type: "state",),
           schemes(type: "central",),
              schemes(type: "institute",),
        ],
      ),
    );
  }
} 

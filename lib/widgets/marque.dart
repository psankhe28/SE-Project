import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class Marque extends StatelessWidget {
  const Marque({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      child: Marquee(
        text: " MAHADBT registration deadline is January 31, 2023",
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        scrollAxis: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        blankSpace: 20.0,
        velocity: 100.0,
        pauseAfterRound: Duration(seconds: 1),
        startPadding: 10.0,
        accelerationDuration: Duration(seconds: 1),
        accelerationCurve: Curves.linear,
        decelerationDuration: Duration(milliseconds: 500),
        decelerationCurve: Curves.easeOut,
      ),
    );
  }
}

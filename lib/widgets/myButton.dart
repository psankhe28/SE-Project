import 'package:flutter/material.dart';

class myButton extends StatelessWidget {
  final Color textColor;
  final Color backColor;
  final double height;
  final double width;
  final double radius;
  final String path;
  final String text;

  const myButton(
      {super.key,
      required this.radius,
      required this.path,
      required this.height,
      required this.width,
      required this.text,
      required this.textColor,
      required this.backColor, });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      minWidth: width,
      onPressed:(){
      
      } , 
      color: backColor,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.blue),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: textColor, fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }
}

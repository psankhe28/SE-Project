import 'package:flutter/material.dart';

class myTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelTxt;
  final String? hintTxt;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Icon myIcon;
  const myTextField(
      {super.key,
      required this.controller,
      required this.labelTxt,
      required this.textInputType,
      required this.validator,
      required this.hintTxt,
      required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Color.fromARGB(255, 97, 49, 218),
        keyboardType: textInputType,
        controller: controller,
        style: const TextStyle(fontSize: 15),
        validator: validator,
        decoration: InputDecoration(
            labelText: labelTxt,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 97, 49, 218), width: 2)),
            prefixIcon: myIcon , 
            hintText: hintTxt,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
      );
  }
}


//  Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: ClipRect(
//                               child: Container(
//                                 width: 20,
//                                 height:20,
//                                 decoration: BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   color: Colors.white,
//                                   image: DecorationImage(
//                                     image: AssetImage("assets/images/history.png"), 
//                                     fit: BoxFit.contain,
//                                   ),
//                                 ),
//                               ),
//                             ),
//               ),
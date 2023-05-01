import 'package:flutter/material.dart';

class mySizedbox extends StatelessWidget {
 double num1;

 mySizedbox({ required this.num1 ,   Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height:MediaQuery.of(context).size.height*num1 ,
    
    ) ; 
  }
}
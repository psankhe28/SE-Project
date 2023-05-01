import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class myDropDown extends StatefulWidget {
  List items;
  String title;

  myDropDown(
      {super.key,
      required this.controller,
      
      required this.items,
      required this.title});
  late TextEditingController controller;
  @override
  State<myDropDown> createState() => _myDropDownState(controller: controller);
}

class _myDropDownState extends State<myDropDown> {
  _myDropDownState({
    required this.controller,
  });
  late TextEditingController controller;
  @override
  String? selectedVal;
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10),
      child: DropdownButton2(
        
        icon:Icon(Icons.arrow_drop_down),
        isExpanded: true,
        hint: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedVal,
        onChanged: (value) {
          setState(() {
            selectedVal = value as String;
            controller.text = selectedVal!;
          });
        },
        buttonHeight: 60,
        buttonWidth: 400,
        itemHeight: 40,
      ),
    );
  }
}

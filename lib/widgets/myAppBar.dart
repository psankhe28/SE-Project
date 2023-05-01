import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  MyAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:Color.fromARGB(255, 97, 49, 218),
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.only(right: 1, left: 24),
        child: Text(
          title!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    );
  }
}

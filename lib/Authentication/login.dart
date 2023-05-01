import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:scholarship_vjti/Authentication/registartion.dart';
import '../Home/home_main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email;
  late String _password;
  @override
  Widget build(BuildContext context) {
    final double height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.15),
            Text(
              "SCHOLAR",
              style: TextStyle(
                  color: Color.fromARGB(255, 97, 49, 218),
                  fontSize: 45,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * 0.1),
            Container(
              child: Text(
                "LOGIN HERE",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: height * 0.03),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: "email",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _email = value;
              }),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock_outline),
                hintText: "password",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onChanged: (value) => setState(() {
                _password = value;
              }),
            ),
            SizedBox(
              height: 150,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 80),
                    backgroundColor: Color.fromARGB(255, 97, 49, 218),
                    textStyle: TextStyle(color: Colors.white),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30))),
                onPressed: () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _email, password: _password)
                      .then((user) => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeMain())))
                      .catchError((e) {
                    Fluttertoast.showToast(msg: "Password is invalid");
                  });
                },
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 19.0, color: Colors.white),
                )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Not Registered Yet?'),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return RegisterPage();
                      }));
                    },
                    child: Text(
                      'Register Now!',
                      selectionColor: Color.fromARGB(255, 97, 49, 218),
                    )),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  Timer(Duration(seconds: 0), () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeMain()));
                  });
                },
                child: Text('next'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

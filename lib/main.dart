import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authWelcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.to(AuthScreenWelcome()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Color.fromRGBO(
                227, 225, 213, 1), //background: rgba(227, 225, 213, 1);

            body: Container(
              alignment: Alignment(0.2, 0.7),
              child: Container(
                height: size.height * 0.5,
                width: size.width * 0.7,
                child: Column(children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Plat Your \n  Future ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "DM Serif",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(45, 57, 21, 1)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "When in doubt, add flowers.",
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "DM Serif",
                        color: Color.fromRGBO(45, 57, 21, 1)),
                  )
                ]),
              ),
            )));
  }
}

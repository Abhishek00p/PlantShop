import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:plantshop/core/hive/hive.dart';
import 'package:plantshop/core/hive/user_adapter.dart';
import 'package:plantshop/screens/authWelcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await HiveBoxes.setupHive();

  await HiveBoxes.openBox();
  // Register the User adapter
  Hive.registerAdapter(UserAdapter());
  runApp(const GetMaterialApp(
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
    Timer(const Duration(seconds: 3), () => Get.to(const AuthScreenWelcome()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color.fromRGBO(
                227, 225, 213, 1), //background: rgba(227, 225, 213, 1);

            body: Container(
              alignment: const Alignment(0.2, 0.7),
              child: SizedBox(
                height: size.height * 0.5,
                width: size.width * 0.7,
                child: Column(children: [
                  Image.asset(
                    "assets/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Plat Your \n  Future ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "DM Serif",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(45, 57, 21, 1)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
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

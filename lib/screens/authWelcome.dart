import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/backend/slider.dart';

class AuthScreenWelcome extends StatefulWidget {
  const AuthScreenWelcome({super.key});

  @override
  State<AuthScreenWelcome> createState() => _AuthScreenWelcomeState();
}

class _AuthScreenWelcomeState extends State<AuthScreenWelcome> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          color: mybackground,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Container(
              child: Column(
                children: [
                  Container(
                    height: size.height * 0.45,
                    width: size.width - 50,
                    child: Image.asset(
                      "assets/authScreen.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\"You can plant a \n dream\"",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: "DM Serif",
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(45, 57, 21, 1)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      "We help realize your dreams in making garden, let’s start with small thing.",
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: "DM Serif",
                          fontWeight: FontWeight.w300,
                          color: Color.fromRGBO(45, 57, 21, 1)),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(LoginRegistrationSlider(0)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: greenColor),
                      height: 48,
                      width: size.width - 50,
                      child: Center(
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: mybackground, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () => Get.to(LoginRegistrationSlider(1)),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: greenColor),
                          borderRadius: BorderRadius.circular(10),
                          color: mybackground),
                      height: 48,
                      width: size.width - 50,
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: greenColor, fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

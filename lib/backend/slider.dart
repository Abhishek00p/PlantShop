import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/Authentication.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/backend/getcontrol.dart';
import 'package:plantshop/home.dart';
import 'package:toast/toast.dart';

class LoginRegistrationSlider extends StatefulWidget {
  int ind;
  LoginRegistrationSlider(this.ind);
  @override
  _LoginRegistrationSliderState createState() =>
      _LoginRegistrationSliderState();
}

final username = TextEditingController();
final password = TextEditingController();
final email = TextEditingController();

class _LoginRegistrationSliderState extends State<LoginRegistrationSlider> {
  int _selectedTabIndex = 0;
  @override
  void initState() {
    _selectedTabIndex = widget.ind;
    super.initState();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: greenColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      padding: EdgeInsets.all(2),
                      width: size.width - 30,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: mybackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTabIndex = 0;
                              });
                            },
                            child: Container(
                              width: (size.width - 30) / 2,
                              decoration: _selectedTabIndex == 0
                                  ? BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(16),
                                      color: greenColor)
                                  : BoxDecoration(),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: _selectedTabIndex == 0
                                        ? mybackground
                                        : greenColor,
                                    fontWeight: _selectedTabIndex == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTabIndex = 1;
                              });
                            },
                            child: Container(
                              width: (size.width - 30) / 2.22,
                              decoration: _selectedTabIndex == 1
                                  ? BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(16),
                                      color: greenColor)
                                  : BoxDecoration(),
                              child: Center(
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: _selectedTabIndex == 0
                                        ? greenColor
                                        : mybackground,
                                    fontWeight: _selectedTabIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35),
                    _selectedTabIndex == 0
                        ? createLogin(size.height, size.width, 0.44, 0.90)
                        : createRegister(size.height, size.width, 0.44, 0.90),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "----------- Or With -----------",
                      style: TextStyle(fontSize: 18, color: mybackground),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            final res = await signInWithGoogle();
                            res["status"] == 200
                                ? Get.to(Home())
                                : Toast.show(res["mesg"]);
                          },
                          child: Image.asset(
                            "assets/Google.png",
                            height: 40,
                            width: 40,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Facebook.png",
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Twitter.png",
                          height: 40,
                          width: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Github Squared.png",
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    _selectedTabIndex == 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                    color: mybackground, fontSize: 16),
                              ),
                              Text(
                                "Sign Up",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              )
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(
                                    color: mybackground, fontSize: 16),
                              ),
                              Text(
                                "Sign In",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              )
                            ],
                          )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

createLogin(h, w, containerh, containerw) {
  final control = Get.put(myGetController());

  return Container(
    height: containerh * h,
    width: containerw * w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: mybackground),
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 2,
          child: Image.asset(
            "assets/upperLeaf.png",
            height: h * 0.13,
            width: h * 0.09,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 2,
          child: Image.asset(
            "assets/lowerLeaf.png",
            height: h * 0.13,
            width: h * 0.09,
          ),
        ),
        Positioned(
          left: w * 0.09,
          top: h * 0.09,
          child: Column(
            children: [
              Container(
                width: w * 0.7,
                child: TextFormField(
                  controller: email,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                width: w * 0.7,
                child: TextFormField(
                  controller: password,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          control.passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          control.passwordVisibility =
                              !control.passwordVisibility;
                        },
                      ),
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  obscureText: control.passwordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Please enter a password with more then 6 charachter';
                    }
                    return "";
                  },
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (v) {},
                    activeColor: Colors.white,
                    checkColor: Colors.black,
                  ),
                  Text(
                    "Remember Me",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(
                    width: w * 0.109,
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () async {
                  final res = await LoginUserWithEmailAndPass(
                      email.text, password.text);

                  username.clear();
                  email.clear();
                  password.clear();

                  res["status"] == 200
                      ? Get.to(Home())
                      : Toast.show(res["mesg"]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      color: greenColor),
                  height: 48,
                  width: w * 0.7,
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: mybackground, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

createRegister(h, w, containerh, containerw) {
  final control = Get.put(myGetController());

  return Container(
    height: containerh * h,
    width: containerw * w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: mybackground),
    child: Stack(
      children: [
        Positioned(
          top: 0,
          left: 2,
          child: Image.asset(
            "assets/upperLeaf.png",
            height: h * 0.13,
            width: h * 0.09,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 2,
          child: Image.asset(
            "assets/lowerLeaf.png",
            height: h * 0.13,
            width: h * 0.09,
          ),
        ),
        Positioned(
          left: w * 0.09,
          top: h * 0.09,
          child: Column(
            children: [
              Container(
                width: w * 0.7,
                child: TextFormField(
                  controller: username,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter your UserName",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                width: w * 0.7,
                child: TextFormField(
                  controller: email,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
              ),
              Container(
                width: w * 0.7,
                child: TextFormField(
                  controller: password,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      suffixIcon: IconButton(
                        icon: Icon(
                          control.passwordVisibility
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          control.passwordVisibility =
                              !control.passwordVisibility;
                        },
                      ),
                      hintStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                  obscureText: control.passwordVisibility,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 6) {
                      return 'Please enter a password with more then 6 charachter';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: h * 0.04,
              ),
              GestureDetector(
                onTap: () async {
                  final res =
                      await CreateUserEmaiAndPass(email.text, password.text);

                  username.clear();
                  email.clear();
                  password.clear();
                  res["status"] == 200
                      ? Get.to(Home())
                      : Toast.show(res["mesg"]);
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      color: greenColor),
                  height: 48,
                  width: w * 0.7,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: mybackground, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

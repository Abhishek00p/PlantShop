import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:toast/toast.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final promodeControler = TextEditingController();

  @override
  void dispose() {
    promodeControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          color: mybackground,
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    "assets/BackArrow.png",
                    height: 40,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "My Cart",
                  style: TextStyle(
                      fontSize: 34,
                      color: greenColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/plant3.png",
                      height: size.height * 0.1,
                      width: size.width * 0.28,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: (size.width * 0.85) - (size.width * 0.28),
                      // color: Colors.amber,
                      child: Stack(
                        children: [
                          Positioned(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Peace Lily, Spathiphyllum - Plant",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Spread the aura of love",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                "Rs 200",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                          Positioned(
                              right: 5,
                              bottom: 5,
                              child: Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/Reduce.png",
                                        height: 24,
                                      ),
                                    ),
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: greenColor),
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Image.asset(
                                        "assets/Add New.png",
                                        height: 24,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Image.asset(
                    "assets/plant4.png",
                    height: size.height * 0.1,
                    width: size.width * 0.28,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: size.height * 0.1,
                    width: (size.width * 0.85) - (size.width * 0.28),
                    // color: Colors.amber,
                    child: Stack(
                      children: [
                        Positioned(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Peace Lily, Spathiphyllum - Plant",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Spread the aura of love",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "Rs 200",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                        Positioned(
                            right: 5,
                            bottom: 5,
                            child: Container(
                              width: 100,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/Reduce.png",
                                      height: 24,
                                    ),
                                  ),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: greenColor),
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/Add New.png",
                                      height: 24,
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ]),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Promo Code",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 50,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightBrown),
                  child: TextFormField(
                    controller: promodeControler,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter Your PromoCode",
                        hintStyle:
                            TextStyle(fontSize: 16, color: mybackground)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Toast.show("Coupen code Applied");
                    },
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: greenColor),
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(color: mybackground),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Text(
                      "Bill Details",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Item",
                          style: TextStyle(color: greenColor),
                        ),
                        Text(
                          "₹500",
                          style: TextStyle(
                              color: greenColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(color: greenColor),
                        ),
                        Text(
                          "-₹50",
                          style: TextStyle(
                              color: greenColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Charges",
                          style: TextStyle(color: greenColor),
                        ),
                        Text(
                          "Free",
                          style: TextStyle(
                              color: gren, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(color: greenColor),
                        ),
                        Text(
                          "₹450",
                          style: TextStyle(
                              color: greenColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Container(
                        height: 40,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: greenColor),
                        child: Center(
                          child: Text(
                            "Checkout",
                            style: TextStyle(color: mybackground),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}

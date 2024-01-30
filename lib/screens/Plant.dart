import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/screens/mycart.dart';
import 'package:toast/toast.dart';

class PlantPage extends StatefulWidget {
  const PlantPage({super.key});

  @override
  State<PlantPage> createState() => _PlantPageState();
}

class _PlantPageState extends State<PlantPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: mybackground,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Image.asset(
                        "assets/BackArrow.png",
                        height: 32,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/Connect.png",
                        height: 24,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/Favorite.png",
                        height: 24,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Image.asset(
                  "assets/catlog.png",
                  height: size.height * 0.44,
                  width: size.width * 0.9,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Peace Lily, Spathiphyllum - Plant",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("Rs 200")
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "(MRP Inclusive of all taxes)",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Shipping ₹ 79 for entire order",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Dispatch in 7 days",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      "Country of origin: India",
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    Container(
                      height: 16,
                      // color: Colors.red,
                      width: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, ind) {
                          return Icon(
                            Icons.star,
                            size: 12,
                            color: Colors.black,
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 80,
                      // color: Colors.amber,
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            child: Container(
                              child: FlutterImageStack(
                                imageSource: ImageSource.asset,
                                itemBorderWidth: 2,
                                itemRadius: 40,
                                backgroundColor: Colors.white,
                                imageList: [
                                  "assets/user1.png",
                                  "assets/user2.png",
                                  "assets/user3.png",
                                  "assets/user4.png",
                                ],
                                itemCount: 3,
                                totalCount: 4,
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 50,
                              child: Text(
                                "(12.7k reviews)",
                                style: TextStyle(fontWeight: FontWeight.w300),
                              )),
                          Positioned(
                              right: 10,
                              bottom: 10,
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(Cart());
                                  Toast.show("Added to cart");
                                },
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: greenColor),
                                  child: Center(
                                    child: Text(
                                      "Add to Cart",
                                      style: TextStyle(
                                          fontSize: 16, color: mybackground),
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

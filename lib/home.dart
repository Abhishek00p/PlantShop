import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:toast/toast.dart';

import 'screens/plant.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: mybackground,
      drawer: Drawer(
        child: Container(
          width: 120,
          color: Colors.red,
          child: Text("sdas"),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: size.height - kToolbarHeight,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Toast.show("Button clicked");
                      },
                      child: Image.asset("assets/menu.png"),
                    ),
                    Container(
                      height: 35,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: lightGreen,
                      ),
                      child: TextFormField(
                        controller: searchController,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search you plant",
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: greenColor,
                              ),
                              alignment: Alignment.bottomRight,
                            ),
                            hintStyle:
                                TextStyle(color: mybackground, fontSize: 16)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset("assets/Cart.png"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: size.height * 0.21,
                  width: size.width * 0.9,
                  child: Scrollbar(
                    radius: Radius.circular(30),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Container(
                          height: size.height * 0.21,
                          width: size.width * 0.9,
                          color: Colors.transparent,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  height: size.height * 0.13,
                                  width: size.width * 0.9,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Today's Tip",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: greenColor),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: size.width * 0.6,
                                      child: Text(
                                        "You can’t buy happiness, but you can buy plants, and that’s pretty much the same thing.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: gren),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: size.width * 0.19,
                                      height: size.height * 0.03,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: greenColor),
                                      child: Center(
                                        child: Text(
                                          "Shop Now",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: mybackground,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  right: 25,
                                  bottom: 10,
                                  child: Container(
                                    height: 20,
                                    width: 50,
                                    decoration: BoxDecoration(boxShadow: [
                                      BoxShadow(
                                          color: Colors.black54,
                                          blurRadius: 25,
                                          offset: Offset(0.0, 0.5))
                                    ]),
                                  )),
                              Positioned(
                                right: 15,
                                bottom: 10,
                                child: Image.asset(
                                  "assets/plant.png",
                                  height: size.height * 0.18,
                                  width: size.width * 0.25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  "Today's Deal",
                  style: TextStyle(
                      fontSize: 32,
                      color: greenColor,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GridView.builder(
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: 15,
                        itemBuilder: (context, ind) {
                          return GestureDetector(
                            onTap: () => Get.to(PlantPage()),
                            child: Container(
                              height: size.height * 0.30,
                              // color: Colors.amber,
                              width: size.width * 0.20,
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      child: Container(
                                        height: size.height * 0.18,
                                        width: size.width * 0.44,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: lightGreen),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 45,
                                            ),
                                            Container(
                                              width: size.width * 0.25,
                                              child: Text(
                                                "Minimal Plant for home decoration",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: mybackground),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Text("RS 200/-",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: mybackground,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Container(
                                              height: 30,
                                              // color: Colors.red,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Toast.show(
                                                            "Button Clicked");
                                                      },
                                                      icon: Icon(
                                                        Icons.shopping_cart,
                                                        size: 16,
                                                        color: mybackground,
                                                      )),
                                                  Container(
                                                    width: 50,
                                                    height: 16,
                                                    // color: Colors.red,
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: 3,
                                                        itemBuilder: (context,
                                                                ind) =>
                                                            Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.yellow,
                                                              size: 12,
                                                            )),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        Toast.show(
                                                            "Button Clicked");
                                                      },
                                                      icon: Icon(
                                                        Icons.favorite,
                                                        size: 16,
                                                        color: mybackground,
                                                      ))
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                                  Positioned(
                                      left: size.width * 0.08,
                                      child: Image.asset(
                                        "assets/plant.png",
                                        height: size.height * 0.10,
                                        width: size.width * 0.25,
                                      )),
                                  Positioned(
                                      top: 60,
                                      left: size.width * 0.13,
                                      child: Container(
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: gren),
                                        child: Center(
                                            child: Text(
                                          "50% Off",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: mybackground),
                                        )),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }))
              ],
            ),
          ),
        ),
      )),
    );
  }
}

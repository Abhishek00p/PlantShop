import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/screens/Plant.dart';

import 'package:plantshop/blocs/plant_bloc/plant_cubit.dart';
import 'package:plantshop/blocs/plant_bloc/plant_state.dart';
import 'package:toast/toast.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeUiScreen extends StatelessWidget {
  HomeUiScreen({
    super.key,
  });

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Container(
          // margin: EdgeInsets.symmetric(vertical: 50),
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
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: "Search you plant",
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: greenColor,
                  ),
                  alignment: Alignment.bottomRight,
                ),
                hintStyle: const TextStyle(color: mybackground, fontSize: 16)),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset("assets/Cart.png"),
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          height: size.height - kToolbarHeight,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: size.height * 0.21,
                  width: size.width * 0.9,
                  child: Scrollbar(
                    radius: const Radius.circular(30),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
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
                                    const Text(
                                      "Today's Tip",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: greenColor),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.6,
                                      child: const Text(
                                        "You can’t buy happiness, but you can buy plants, and that’s pretty much the same thing.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: gren),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      width: size.width * 0.19,
                                      height: size.height * 0.03,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: greenColor),
                                      child: const Center(
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
                                    decoration: const BoxDecoration(boxShadow: [
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
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Today's Deal",
                  style: TextStyle(
                      fontSize: 32,
                      color: greenColor,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                BlocProvider(
                  create: (context) => PlantCubit()..getAllPlants(),
                  child: BlocBuilder<PlantCubit, PlantState>(
                    builder: (context, state) {
                      if (state is GetAllPlantInitialState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetAllPlantLoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetAllPlantErrorState) {
                        return Center(
                          child: Text(state.exception.message),
                        );
                      } else if (state is GetAllPlantLoadedState) {
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10),
                            itemCount: state.plants.length,
                            itemBuilder: (context, ind) {
                              final singlePlant = state.plants[ind];
                              return GestureDetector(
                                onTap: () => Get.to(const PlantPage()),
                                child: SizedBox(
                                  height: size.height * 0.30,
                                  // color: Colors.amber,
                                  width: size.width * 0.20,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                          bottom: 0,
                                          child: Container(
                                            // height: size.height * 0.18,
                                            width: size.width * 0.44,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: lightGreen),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                const SizedBox(
                                                  height: 45,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.25,
                                                  child: Text(
                                                    singlePlant.name ?? '',
                                                    style: const TextStyle(
                                                        fontSize: 12,
                                                        color: mybackground),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Text(
                                                    r'$' +
                                                        (singlePlant.price ?? 0)
                                                            .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        color: mybackground,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                SizedBox(
                                                  height: 20,
                                                  child: Text(
                                                      'category ${singlePlant.category}',
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          color: mybackground,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                  // color: Colors.red,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            Toast.show(
                                                                "Button Clicked");
                                                          },
                                                          icon: const Icon(
                                                            Icons.shopping_cart,
                                                            size: 16,
                                                            color: mybackground,
                                                          )),
                                                      SizedBox(
                                                        width: 62,
                                                        height: 16,
                                                        // color: Colors.red,
                                                        child: Row(
                                                          children: [
                                                            Row(
                                                              children:
                                                                  List.generate(
                                                                      singlePlant
                                                                              .rating ??
                                                                          0,
                                                                      (index) =>
                                                                          const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Colors.yellow,
                                                                            size:
                                                                                12,
                                                                          )),
                                                            ),
                                                            Row(
                                                              children:
                                                                  List.generate(
                                                                      5 -
                                                                          (singlePlant.rating ??
                                                                              0),
                                                                      (index) =>
                                                                          const Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Colors.grey,
                                                                            size:
                                                                                12,
                                                                          )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            Toast.show(
                                                                "Button Clicked");
                                                          },
                                                          icon: const Icon(
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
                                            child: const Center(
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
                            });
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
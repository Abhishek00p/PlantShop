import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantshop/backend/colors.dart';
import 'package:plantshop/bottomNavBar/bottom_nav_bar_cubit.dart';
import 'package:plantshop/bottomNavBar/home_ui.dart';
import 'package:plantshop/bottomNavBar/post_a_plant_screen.dart';
import 'package:plantshop/bottomNavBar/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// only include Ui without scaffolds
  final _pages = [
    HomeUiScreen(),
    const PostAPlantScreenProvider(),
    const ProfilePage(),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mybackground,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: context.watch<BottomNavBarCubit>().state,
          selectedLabelStyle: TextStyle(color: Colors.green),
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle: TextStyle(color: Colors.grey),
          onTap: (index) {
            context.read<BottomNavBarCubit>().updatePageIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_rounded),
              label: 'Profile',
            )
          ]),
      body: _pages[context.watch<BottomNavBarCubit>().state],
    );
  }
}

import 'package:city_channel_app/screens/adminLoginScreen.dart';
import 'package:city_channel_app/screens/homescreen.dart';
import 'package:city_channel_app/screens/livetvscreen.dart';
import 'package:city_channel_app/screens/newsscreen.dart';
import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentSelectedIndex = 0;

  final pages = [
    // HomeScreen(),
    HomeScreen(), NewsScreen(), LivetvScreen(),

    //
    // LivetvScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 3, 108),
        leadingWidth: 100,
        leading: GestureDetector(
          onLongPress: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => AdminLoginScreen()),
              ),
            );
          },
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => MainScreen()),
              ),
            );
          },
          child: const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Image(
              width: 100,
              image: AssetImage('asset/citylogo.jpg'),
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
      ),
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      body: pages[_currentSelectedIndex],
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Color.fromARGB(255, 12, 3, 108),
        currentIndex: _currentSelectedIndex,
        onTap: (newIndex) {
          setState(() {
            _currentSelectedIndex = newIndex;
          });
        },
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.newspaper, title: 'News'),
          FloatingNavbarItem(icon: Icons.tv, title: 'Live TV'),
        ],
      ),
    );
  }
}

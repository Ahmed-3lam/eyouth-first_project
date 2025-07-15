import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_project/Ecommerce/home/home_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> _screens = [
    HomeScreen(),
    Container(
      child: Center(
        child: Text(
          "Profile",
          style: TextStyle(fontSize: 100),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "Cart",
          style: TextStyle(fontSize: 100),
        ),
      ),
    ),
    Container(
      child: Center(
        child: Text(
          "Setting",
          style: TextStyle(fontSize: 100),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        backgroundColor: Colors.transparent,
        items: [
          Icon(Icons.home, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}

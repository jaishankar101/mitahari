import 'package:flutter/material.dart';
import 'package:mitahari/screens/recipes.dart';
import 'package:mitahari/screens/temp.dart';

import 'home.dart';

class navigator extends StatefulWidget {
  const navigator({super.key});

  @override
  State<navigator> createState() => _navigatorState();
}

class _navigatorState extends State<navigator> {
  int currentPage = 0;

  static List<Widget> screens = [
    Home(),
    recipes(),
    temp(gender: "Male", age: 20, height: 140, weight: 50),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dining_rounded),
            label: 'Recipes',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        selectedItemColor: const Color(0xFFFFC300),
        elevation: 5.0,
        unselectedItemColor: Colors.green[900],
        backgroundColor: const Color(0xFF581845),
      ),
    );
  }
}

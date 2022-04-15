// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:worm/page/myHomePage.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/page/payment.dart';
import 'package:worm/page/profile.dart';


class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int currentIndex = 0;
  final screens = [
    const MyHomePage(),
    const jadwalPage(),
    const payment(),
    const profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 20,
        selectedIconTheme: const IconThemeData(color: Color.fromRGBO(254, 204, 118, 1),size:25),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),  
        selectedItemColor: const Color.fromRGBO(254, 204, 118, 1),
        // selectedFontSize: 15,
        currentIndex: currentIndex,
        // showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 41, 40, 40),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal',
            backgroundColor: Color.fromARGB(255, 41, 40, 40),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pembayaran',
            backgroundColor: Color.fromARGB(255, 41, 40, 40),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 41, 40, 40),
          ),
        ],
      ),
    );
  }
}

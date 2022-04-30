// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:worm/page/myHomePage.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/page/pembayaran/payment.dart';
import 'package:worm/page/profile.dart';

class navbar extends StatefulWidget {
  int index;
  navbar({Key? key, required this.index}) : super(key: key);

  @override
  State<navbar> createState() => _navbarState(index);
}

class _navbarState extends State<navbar> {
  int currentIndex;
  _navbarState(this.currentIndex);

  final screens = [
    const MyHomePage(),
    const jadwalPage(),
    const PagePayment(),
    const profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        iconSize: 25,
        selectedIconTheme: const IconThemeData(
            color: Color.fromRGBO(254, 204, 118, 1), size: 30),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
        selectedItemColor: const Color.fromRGBO(254, 204, 118, 1),
        currentIndex: currentIndex,
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

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:worm/page/myHomePage.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/page/payment.dart';
import 'package:worm/page/profile.dart';

// class navbar extends StatefulWidget {
//   const navbar({Key? key}) : super(key: key);

//   @override
//   State<navbar> createState() => _navbarState();
// }

// class _navbarState extends State<navbar> {
//   int _selectedNavbar = 0;

//   void _changeSelectedNavBar(int index) {
//     if (index == 1) Navigator.pushNamed(context, "/jadwal");
//     setState(() {
//       _selectedNavbar = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return ConvexAppBar(
//     //   backgroundColor: Colors.white,
//     //   activeColor: Colors.black,
//     //   color: Color.fromRGBO(121, 131, 146, 100),
//     //   items: const [
//     //     TabItem(
//     //       icon: Icons.home,
//     //       title: 'Home',
//     //     ),
//     //     TabItem(
//     //       icon: Icons.timeline,
//     //       title: 'Jadwal',
//     //     ),
//     //     TabItem(
//     //       icon: Icons.money,
//     //       title: 'Payments',
//     //     ),
//     //     TabItem(icon: Icons.people, title: 'Profile'),
//     //   ],
//     //   initialActiveIndex: _selectedNavbar,
//     //   onTap: _changeSelectedNavBar,
//     // );
//   }
// }
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
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        selectedItemColor: Color.fromRGBO(254, 204, 118, 1),
        unselectedItemColor: Color.fromRGBO(121, 131, 146, 1),
        // selectedFontSize: 15,
        currentIndex: currentIndex,
        // showUnselectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pembayaran',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

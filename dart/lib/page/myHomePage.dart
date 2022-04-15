// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/page/payment.dart';
import 'package:worm/page/profile.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int currentIndex = 0;
  // final screens = [
  //   const MyHomePage(),
  //   const jadwalPage(),
  //   const payment(),
  //   const profile(),
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          
          Container(
            margin: EdgeInsets.only(right: 16, left: 16, top: 10),
            child: Text("Hi, Ainul"),
            
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 16, left: 16),

            child: DigitalClock(
              showSecondsDigit: false,
              is24HourTimeFormat: false,
              areaDecoration: BoxDecoration(
                color: Color.fromRGBO( 47, 47, 47, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hourMinuteDigitTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              amPmDigitTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16, ),
            height: 50,

            color: Colors.white,
            alignment: Alignment.center,
            child: const Text("Jadwal Kegiatan"),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
            height: 450,
            color: Colors.white,
            child: ListView(
              children: const [
                ListTile(
                  title: Text("Progres 1"),
                  subtitle: Text(
                    "Progres sudah selesai",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text("10.00 PM"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Progres 2"),
                  subtitle: Text(
                    "Progres sudah selesai",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text("10.00 PM"),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Progres 3"),
                  subtitle: Text(
                    "Progres sudah selesai",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Text("10.00 PM"),
                ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   backgroundColor: Colors.blue,
      //   selectedItemColor: Colors.white,
      //   unselectedItemColor: Colors.amber,
      //   // selectedFontSize: 15,
      //   currentIndex: currentIndex,
      //   // showUnselectedLabels: false,
      //   onTap: (index) => setState(() => currentIndex = index),
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.schedule),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.payment),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Home',
      //     ),
      //   ],
      // ),
    );
  }
}

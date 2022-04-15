// import 'dart:html';
import 'package:flutter/material.dart';
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
            margin: const EdgeInsets.only(right: 16, left: 16, top: 10),
            child: const Text("Hi, Ainul"),
            
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16),

            child: DigitalClock(
              showSecondsDigit: false,
              is24HourTimeFormat: false,
              areaDecoration: BoxDecoration(
                color: const Color.fromRGBO( 47, 47, 47, 1),
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
            margin: const EdgeInsets.only(right: 16, left: 16),
            height: 480,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 18),
                  alignment: Alignment.center,
                  child: const Text(
                    "Jadwal Kegiatan",
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text("Progres 1"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("10.00 PM"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 2"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("11.00 PM"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 3"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("12.00 PM"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 4"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("12.00 PM"),
                ),
                const Divider(),
              ],
            ),
          ),
          // Container(
            
          //   margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          //   height: 450,
          //   color: Colors.white,
          //   child: ListView(
              
          //     children: const [
          //       ListTile(
          //         title: Text("Progres 1"),
          //         subtitle: Text(
          //           "Progres sudah selesai",
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         trailing: Text("10.00 PM"),
          //       ),
          //       Divider(
          //         color: Colors.grey,
          //       ),
          //       ListTile(
          //         title: Text("Progres 2"),
          //         subtitle: Text(
          //           "Progres sudah selesai",
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         trailing: Text("10.00 PM"),
          //       ),
          //       Divider(
          //         color: Colors.grey,
          //       ),
          //       ListTile(
          //         title: Text("Progres 3"),
          //         subtitle: Text(
          //           "Progres sudah selesai",
          //           maxLines: 2,
          //           overflow: TextOverflow.ellipsis,
          //         ),
          //         trailing: Text("10.00 PM"),
          //       ),
          //       Divider(
          //         color: Colors.grey,
          //       ),
          //     ],
          //   ),
          // ),

        ],
      ),

    );
  }
}

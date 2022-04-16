// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16, top: 16),
            child: const Text(
              "Hi, Ainul", 
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal),
                ),
          ),

          const SizedBox(
            height: 10,
          ),

          Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            child: DigitalClock(
              showSecondsDigit: false,
              is24HourTimeFormat: true,
              areaDecoration: BoxDecoration(
                color: const Color.fromRGBO( 47, 47, 47, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              hourMinuteDigitTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              amPmDigitTextStyle: const TextStyle(
                  color: Colors.white, 
                  fontWeight: FontWeight.bold
                  ),
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
              borderRadius: BorderRadius.circular(10),
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
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  alignment: Alignment.center,
                  child: const Text(
                    "Jadwal Kegiatan",
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const ListTile(
                  title: Text("Progres 1"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("22.00"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 2"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("23.00"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 3"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("00.00"),
                ),
                const Divider(),
                const ListTile(
                  title: Text("Progres 4"),
                  subtitle: Text(
                    "Progres sudah selesai",
                  ),
                  trailing: Text("12.00"),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

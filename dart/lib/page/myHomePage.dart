// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:getwidget/getwidget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(10)),
          const Text(
            "Hi, Ainul",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DigitalClock(
            showSecondsDigit: false,
            is24HourTimeFormat: true,
            areaDecoration: BoxDecoration(
              color: const Color.fromRGBO(47, 47, 47, 1),
              borderRadius: BorderRadius.circular(10),
            ),
            hourMinuteDigitTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 50,
            ),
            amPmDigitTextStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),

          Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                const ListTile(
                  title: Text(
                    "Progress",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    "80%",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                GFProgressBar(
                  margin: const EdgeInsets.only(right: 16, left: 16),
                  percentage: 0.8,
                  lineHeight: 10,
                  backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                  progressBarColor: const Color.fromRGBO(254, 204, 118, 1),
                )
              ],
            ),
          ),

          const Padding(padding: EdgeInsets.all(4)),

          Container(
            margin: const EdgeInsets.only(right: 16, left: 16),
            height: MediaQuery.of(context).size.height * 0.60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 0), // Shadow position
                ),
              ],
            ),
            
            child: Column(         
              children: <Widget>[    
                Container(
                  margin: const EdgeInsets.only(top:20,bottom: 20),
                  child: const Text(
                    "Jadwal Kegiatan",
                    style: TextStyle(fontWeight: FontWeight.normal,fontSize: 15),
                    ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.52,
                  child: ListView(
                    children: const [
                      ListTile(
                        title: Text("Progres 1"),
                        subtitle: Text(
                          "Progres sudah selesai",
                        ),
                        trailing: Text("22.00"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Progres 2"),
                        subtitle: Text(
                          "Progres sudah selesai",
                        ),
                        trailing: Text("23.00"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Progres 3"),
                        subtitle: Text(
                          "Progres sudah selesai",
                        ),
                        trailing: Text("00.00"),
                      ),
                      Divider(),
                      ListTile(
                        title: Text("Progres 4"),
                        subtitle: Text(
                          "Progres sudah selesai",
                        ),
                        trailing: Text("12.00"),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ],
              
            ),
          ),
        ],
      ),
    );
  }
}

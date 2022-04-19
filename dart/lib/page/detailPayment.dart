// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:worm/page/uploadPayment.dart';
import 'package:worm/widgets/navbar.dart';

class detailPayment extends StatefulWidget {
  const detailPayment({Key? key}) : super(key: key);

  @override
  State<detailPayment> createState() => _detailPayment();
}

class _detailPayment extends State<detailPayment> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text(
      //     "Detail Pembayaran",
      //     style: TextStyle(
      //       color: Colors.black,
      //       fontSize: 17,
      //       fontWeight: FontWeight.w600,
      //     ),
      //   ),
      //   backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
      // ),
      body: Column(
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(18.0)),
          const Padding(padding: EdgeInsets.only(top: 8)),
          Container(
            margin: const EdgeInsets.only(top: 15, right: 16, left: 16),
            height: 70,
            child: Row(
              children: <Widget>[
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const navbar();
                              })),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            size: 22,
                          )),
                    ],
                  ),
                ),
                const Padding(padding: EdgeInsets.only(left: 15)),
                const Text(
                  "Detail Pembayaran",
                  style: TextStyle(
                    color: Color.fromARGB(255, 24, 24, 24),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
            height: MediaQuery.of(context).size.height * 0.7,
            color: const Color(0xFFe5e5e5),
            child: Container(
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
              child: ListView(
                children: [
                  ListTile(
                    title: const Text("Ainul Muhlasin"),
                    subtitle: const Text(
                      "Rp85.000.000,-",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: const [
                            Text("Maret 2022"),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Blom Lunas",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: const Text("Rp5.000.000,-"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: const [
                            Text("12 Maret 2022",
                                style: TextStyle(color: Color(0xFF828282))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "05.35 PM",
                              style: TextStyle(color: Color(0xFF828282)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text("Rp10.000.000,-"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: const [
                            Text("12 Maret 2022",
                                style: TextStyle(color: Color(0xFF828282))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "05.35 PM",
                              style: TextStyle(color: Color(0xFF828282)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  ListTile(
                    title: Text("Rp20.000.000,-"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: const [
                            Text("12 Maret 2022",
                                style: TextStyle(color: Color(0xFF828282))),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "05.35 PM",
                              style: TextStyle(color: Color(0xFF828282)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.only(right: 16, left: 16),
              height: 50,
              width: 400,
              color: const Color(0xFFe5e5e5),
              child: Container(
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
                    children: const [
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Bukti Pembayaran",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
            ),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const uploadPayment();
            })),
          ),
        ],
      ),
    );
  }
}

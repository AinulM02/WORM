import 'package:worm/page/payment.dart';
import 'package:flutter/material.dart';
import 'package:worm/widgets/navbar.dart';

// import 'package:flutter/src/widgets/container.dart';

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
      backgroundColor: Color(0xFFe5e5e5),
      appBar: AppBar(
        title: const Text(
          "Rekap Pembayaran",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 41, 40, 40),
      ),
      body: ListView(children: <Widget>[
        Padding(padding: const EdgeInsets.all(16.0)),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
          height: 300,
          width: 400,
          color: Color(0xFFe5e5e5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              children: [
                ListTile(
                  title: Text("Ainul Muhlasin"),
                  subtitle: Text(
                    "Rp. 85.000.000, -",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        children: [
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
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Rp. 5.000.000, -"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        children: [
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
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Rp. 10.000.000, -"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Column(
                        children: [
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
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                    title: Text("Rp. 20.000.000, -"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Column(
                          children: [
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
        Container(
          margin: EdgeInsets.only(right: 16, left: 16),
          height: 50,
          width: 400,
          color: Color(0xFFe5e5e5),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Bukti Pembayaran",
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        )
      ]),
      // bottomNavigationBar: const navbar(),
    );
  }
}

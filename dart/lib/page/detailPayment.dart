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
      appBar: AppBar(
        title: const Text(
          "Detail Pembayaran",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      ),
      body: ListView(children: <Widget>[
        Padding(padding: const EdgeInsets.all(8)),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 8),
          height: 300,
          width: 400,
          color: Color(0xFFe5e5e5),
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
                  title: Text("Ainul Muhlasin"),
                  subtitle: Text(
                    "Rp85.000.000,-",
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
                  title: Text("Rp5.000.000,-"),
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
                  title: Text("Rp10.000.000,-"),
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
                    title: Text("Rp20.000.000,-"),
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
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Bukti Pembayaran",
                    textAlign: TextAlign.center,
                  ),
                ],
              )
          ),
        )
      ]),
    );
  }
}

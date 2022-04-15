import 'package:flutter/material.dart';
import 'package:worm/widgets/navbar.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _payment();
}

class _payment extends State<payment> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Rekap Pembayaran"),
      // ),
      // body: Column(children: [
      //   Padding(padding: const EdgeInsets.all(16.0)),
      //   Container(
      //     margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
      //     height: 150,
      //     width: 400,
      //     color: Color.fromRGBO(246, 246, 246, 1),
      //     child: ListView(
      //       children: const [
      //         ListTile(
      //           title: Text("Maret 2022"),
      //         ),
      //         ListTile(
      //           title: Text("Progres 3"),
      //           subtitle: Text(
      //             "Progres sudah selesai",
      //             maxLines: 2,
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //         ),
      //         Divider(
      //           color: Colors.black,
      //         ),
      //       ],
      //     ),
      //   ),
      //   Container(
      //     margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
      //     height: 150,
      //     width: 400,
      //     color: Color.fromRGBO(246, 246, 246, 1),
      //     child: ListView(
      //       children: const [
      //         ListTile(
      //           title: Text("Progres 3"),
      //           subtitle: Text(
      //             "Progres sudah selesai",
      //             maxLines: 2,
      //             overflow: TextOverflow.ellipsis,
      //           ),
      //           trailing: Text("10.00 PM"),
      //         ),
      //         Divider(
      //           color: Colors.black,
      //         ),
      //       ],
      //     ),
      //   ),
      // ]),
      // // bottomNavigationBar: const navbar(),
      appBar: AppBar(
        title: const Text(
          "Rekap Pembayaran",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(children: [
        Padding(padding: const EdgeInsets.all(16.0)),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
          height: 220,
          width: 400,
          color: Color(0xFFe5e5e5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              children: const [
                ListTile(
                  title: Text("Maret 2022"),
                  trailing: Text(
                    "Masih utang la bang",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Wedding Organize"),
                  subtitle: Text(
                    "Rp. 100.000.000, -",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text(
                    "Terbayar",
                    style: TextStyle(color: Color(0xFF666D66)),
                  ),
                  trailing: Text(
                    "Rp. 20.000, -",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(right: 16, left: 16, bottom: 16),
          height: 220,
          width: 400,
          color: Color(0xFFe5e5e5),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: ListView(
              children: const [
                ListTile(
                  title: Text("Maret 2022"),
                  trailing: Text(
                    "Hore Lunas",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text("Wedding Organize"),
                  subtitle: Text(
                    "Rp. 100.000.000, -",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  title: Text(
                    "Terbayar",
                    style: TextStyle(color: Color(0xFF666D66)),
                  ),
                  trailing: Text(
                    "Rp. 100.000.000, -",
                    style: TextStyle(color: Color(0xFF828282)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

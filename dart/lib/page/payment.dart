// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _payment();
}

class _payment extends State<payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Rekap Pembayaran",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            ),
        ),
        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
      ),
      body: Column(children: [
        const Padding(padding: EdgeInsets.all(16.0)),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          height: 220,
          width: 400,
          color: const Color(0xFFe5e5e5),
          child: Container(
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
          margin: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          height: 220,
          width: 400,
          color: const Color(0xFFe5e5e5),
          child: Container(
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

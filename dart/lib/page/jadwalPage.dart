// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:worm/page/tambahJadwal.dart';
import 'package:getwidget/getwidget.dart';

class jadwalPage extends StatefulWidget {
  const jadwalPage({Key? key}) : super(key: key);

  @override
  State<jadwalPage> createState() => _jadwalPageState();
}

class _jadwalPageState extends State<jadwalPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.all(18.0)),
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
                      color: Colors.black,
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
        const Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16),
          height: MediaQuery.of(context).size.height * 0.732,
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
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Jadwal Kegiatan",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                title: const Text("Progres 1"),
                subtitle: const Text(
                  "Progres sudah selesai",
                ),
                trailing: Text("10.00 PM"),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const tambahJadwal();
                })),
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
      ]),
    );
  }
}

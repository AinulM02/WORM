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
          height: 77,
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
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                ),
                trailing: Text(
                  "80%",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GFProgressBar(
                margin: const EdgeInsets.only(right: 16, left: 16),
                percentage: 0.8,
                lineHeight: 10,
                backgroundColor: const Color.fromARGB(255, 209, 209, 209),
                progressBarColor: const Color.fromRGBO(254, 204, 118, 1),
              )
            ],
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16),
          height: 486,
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
                margin: const EdgeInsets.only( bottom: 16),
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
                trailing: Text("10.00 PM"),
                // onTap: (){
                //   Navigator.pus
                // },
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

import 'package:flutter/material.dart';
import 'package:worm/widgets/navbar.dart';

class jadwalPage extends StatefulWidget {
  const jadwalPage({Key? key}) : super(key: key);

  @override
  State<jadwalPage> createState() => _jadwalPageState();
}

class _jadwalPageState extends State<jadwalPage> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      body: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.all(16.0)),
        Container(
          margin: const EdgeInsets.only(right: 16, left: 16),
          height: 580,
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
        //   margin: const EdgeInsets.only(right: 16, left: 16),
        //   height: 50,

        //   color: Colors.white,
        //   alignment: Alignment.center,
        //   child: const Text("Jadwal Kegiatan"),

        // ),
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
      ]),
      // bottomNavigationBar: const navbar(),
    );
  }
}

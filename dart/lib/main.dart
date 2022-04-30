import 'package:flutter/material.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/page/detailJadwal.dart';
import 'package:worm/page/FormEditJadwal.dart';
import 'package:worm/page/jadwalPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WORM',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        fontFamily: 'Poppins',
      ),
      // home: navbar(index: 0),
      initialRoute: '/',
      routes: {
        '/': (context) => navbar(index: 0),
        '/detail-page': (context) => detailJadwal(),
        '/form-edit': (context) => editJadwal(),
        '/jadwal-page': (context) => jadwalPage(),
      },
    );
  }
}

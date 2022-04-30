// // ignore_for_file: camel_case_types

// import 'package:flutter/material.dart';
// import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';

// class profile extends StatefulWidget {
//   const profile({Key? key}) : super(key: key);

//   @override
//   State<profile> createState() => _profileState();
// }

// class _profileState extends State<profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           Container(
//             height: 270,
//             decoration: const BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromARGB(255, 31, 31, 31),
//                   Color.fromARGB(214, 10, 10, 10)
//                 ],
//                 begin: Alignment.centerLeft,
//                 end: Alignment.centerRight,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   margin: const EdgeInsets.only(top: 20, bottom: 20),
//                   child: const Text(
//                     "Data Profile",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: const <Widget>[
//                     CircleAvatar(
//                       backgroundColor: Colors.grey,
//                       minRadius: 66,
//                       child: CircleAvatar(
//                         radius: 65,
//                         backgroundImage: AssetImage("assets/images/Aan.jpg"),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 20),
//                   width: 150,
//                   height: 25,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     color: Colors.white,
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Ainul Muhlasin",
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.normal,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
//             height: 60,
//             width: 400,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: FlatButton(
//               child: const Text('FAQ'),
//               color: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {},
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 10, right: 16, left: 16),
//             height: 60,
//             width: 400,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: FlatButton(
//               child: const Text('About'),
//               color: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {},
//             ),
//           ),
//           Container(
//             margin: const EdgeInsets.only(top: 10, right: 16, left: 16),
//             height: 60,
//             width: 400,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.grey,
//                   blurRadius: 2,
//                   offset: Offset(0, 0),
//                 ),
//               ],
//             ),
//             child: FlatButton(
//               child: const Text('WA'),
//               color: Colors.white,
//               textColor: Colors.black,
//               onPressed: () {
//                 FlutterOpenWhatsapp.sendSingleMessage(
//                     "918179015345", "Yayayaya");
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

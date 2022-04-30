// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:worm/model/sceduleModel.dart';
import 'package:worm/page/detailJadwal.dart';
import 'package:worm/page/tambahJadwal.dart';
import 'package:getwidget/getwidget.dart';
import 'package:worm/service/sceduleService.dart';
import 'package:worm/page/detailJadwal.dart';

class jadwalPage extends StatefulWidget {
  static final url = "/jadwal-page";
  const jadwalPage({Key? key}) : super(key: key);

  @override
  State<jadwalPage> createState() => _jadwalPageState();
}

class _jadwalPageState extends State<jadwalPage> {
  late Future<Scedule> _scedule;
  int id = 0;

  @override
  void initState() {
    super.initState();
    _scedule = SceduleService().getAllSchedule();
  }

  void refreshData() {
    id++;
  }

  FutureOr onGoBack(dynamic value) {
    refreshData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bottomNavigation = MediaQuery.of(context).viewInsets.bottom;
    final pageHeight = height - bottomNavigation;

    return Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(16.0)),
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16),
              height: MediaQuery.of(context).size.height * 0.11,
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
                  Container(
                    margin: const EdgeInsets.only(top: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 110),
                          child: const Text(
                            "Jadwal Kegiatan",
                            style: TextStyle(
                                fontWeight: FontWeight.normal, fontSize: 16),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(left: 60)),
                        IconButton(
                            alignment: Alignment.bottomRight,
                            color: Colors.amber,
                            onPressed: () => Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const tambahJadwal();
                                })),
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: FutureBuilder(
                      future: _scedule,
                      builder: (context, AsyncSnapshot<Scedule> snapshot) {
                        var state = snapshot.connectionState;
                        if (state != ConnectionState.done) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            // return ListView.builder(
                            //   shrinkWrap: true,
                            //   scrollDirection: Axis.vertical,
                            //   itemBuilder: (context, index) {
                            //     var scedule = snapshot.data!.data[index];
                            //     return InkWell(
                            //       onTap: () {
                            //         Navigator.push(context,
                            //             MaterialPageRoute(builder: (context) {
                            //           return const detailJadwal();
                            //         }));
                            //       },
                            //       child: listItem(scedule),
                            //     );
                            //   },
                            //   itemCount: snapshot.data!.data.length,
                            // );
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                var schedule = snapshot.data!.data[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, detailJadwal.url,
                                        arguments: schedule);
                                  },
                                  child: listItem(schedule),
                                );
                              },
                              itemCount: snapshot.data!.data.length,
                            );


                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                snapshot.error.toString(),
                              ),
                            );
                          } else {
                            return Text('');
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget listItem(Scedules view) {
    return ListTile(
      title: Text(view.namaKegiatan),
      subtitle: Text(
        "Progres sudah selesai",
      ),
      trailing: Text(view.jam),
      // onTap: () =>
      //     Navigator.pushNamed(context, detailJadwal.url,
      //                     arguments: vacation);
      // })),
    );
  }
}

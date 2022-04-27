import 'dart:async';
import 'package:flutter/material.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:getwidget/getwidget.dart';
import 'package:worm/page/detailJadwal.dart';
import 'package:worm/service/sceduleService.dart';
import 'package:worm/model/sceduleModel.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(padding: EdgeInsets.all(16)),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: const Text(
              "Hi, Ainul",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 16),
            child: DigitalClock(
              areaWidth: 380,
              showSecondsDigit: false,
              is24HourTimeFormat: true,
              areaDecoration: BoxDecoration(
                color: const Color.fromRGBO(47, 47, 47, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              hourMinuteDigitTextStyle: const TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
              amPmDigitTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
          const Padding(padding: EdgeInsets.all(4)),
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
                  margin: const EdgeInsets.only(top: 16, bottom: 16),
                  child: const Text(
                    "Jadwal Kegiatan",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.53,
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
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              var scedule = snapshot.data!.data[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return const detailJadwal();
                                  }));
                                },
                                child: listItem(scedule),
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
        ],
      ),
    );
  }

  Widget listItem(Scedules view) {
    return ListTile(
      title: Text(view.namaKegiatan),
      subtitle: Text(
        "Progres sudah selesai",
      ),
      trailing: Text(view.jam),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const detailJadwal();
      })),
    );
  }
}

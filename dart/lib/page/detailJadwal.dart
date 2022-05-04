import 'package:flutter/material.dart';
import 'package:worm/page/tambahJadwal.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/page/FormEditJadwal.dart';
import 'package:worm/service/sceduleService.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:worm/model/sceduleModel.dart';
import 'package:intl/intl.dart';

class detailJadwal extends StatelessWidget {
  static final url = "/detail-page";
  const detailJadwal({Key? key}) : super(key: key);

//   @override
//   State<detailJadwal> createState() => _detailJadwalState();
// }

// class _detailJadwalState extends State<detailJadwal> {
  @override
  Widget build(BuildContext context) {
    final Scedules schedule =
        ModalRoute.of(context)!.settings.arguments as Scedules;

    String tanggal = DateFormat.yMd().format(schedule.tanggal);

    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.black,
        animatedIcon: AnimatedIcons.menu_arrow,
        children: [
          SpeedDialChild(
              child: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, editJadwal.url,
                    arguments: schedule);
              }),
          SpeedDialChild(
              child: Icon(Icons.delete),
              onTap: () async {
                // await SceduleService().deleteSchedule(schedule.id).then(
                //     ((value) => Navigator.pushReplacementNamed(context, '/jadwal-page')));

                await SceduleService()
                    .deleteSchedule(schedule.id)
                    .then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return navbar(index: 1);
                  }));
                });
              }),
        ],
      ),
      body: Column(children: <Widget>[
        const Padding(padding: EdgeInsets.all(18.0)),
        const Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          margin: const EdgeInsets.only(top: 15, right: 16, left: 16),
          height: 70,
          child: Row(
            children: <Widget>[
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        alignment: Alignment.centerRight,
                        onPressed: () => Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return navbar(index: 1);
                            })),
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                        )),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(left: 15)),
              const Text(
                "Detail Kegiatan",
                style: TextStyle(
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
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
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Nama Kegiatan  :"),
                    Text(schedule.namaKegiatan),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Tanggal  :"),
                    Text(tanggal),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Waktu      :"),
                    Text(schedule.jam),
                  ],
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
              //   child: Row(
              //     children: [
              //       Text("Kegiatan :"),
              //       Text("   Meeting dengan Customer"),
              //     ],
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail       :"),
                    Flexible(
                      child: Text(
                        schedule.detailKegiatan,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tempat   :"),
                    Flexible(
                      child: Text(
                        schedule.tempat,
                        maxLines: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

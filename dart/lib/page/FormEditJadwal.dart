// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/model/sceduleModel.dart';
import 'package:worm/page/detailJadwal.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/service/sceduleService.dart';

class editJadwal extends StatefulWidget {
  static final url = "/form-edit";
  const editJadwal({Key? key}) : super(key: key);

  @override
  State<editJadwal> createState() => _tambahJadwalState();
}

class _tambahJadwalState extends State<editJadwal> {
  TextEditingController _nameKegiatanController = TextEditingController();
  TextEditingController _detailKegiatanController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _tempatController = TextEditingController();

  TimeOfDay time = TimeOfDay.now();
  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _jamController.text = value!.format(context).toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final Scedules schedule =
        ModalRoute.of(context)!.settings.arguments as Scedules;

    if (schedule != null) {
      _nameKegiatanController.text = schedule.namaKegiatan;
      _detailKegiatanController.text = schedule.detailKegiatan;
      _jamController.text = schedule.jam;
      _tempatController.text = schedule.tempat;
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(padding: EdgeInsets.all(16.0)),
          Container(
            margin: const EdgeInsets.only(top: 16, right: 16, left: 16),
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
                                return navbar(index: 2);
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
                  "Tambah Jadwal",
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
            margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nama Kegiatan",
                ),
                TextField(
                  controller: _nameKegiatanController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Detail Kegiatan",
                ),
                TextField(
                  controller: _detailKegiatanController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: DateTimePicker(
              dateMask: 'd MMM, yyyy',
              initialValue: schedule.tanggal.toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              icon: const Icon(Icons.event),
              dateLabelText: 'Tanggal pelaksanaan',
              selectableDayPredicate: (date) {
                // Disable weekend days to select from the calendar
                if (date.weekday == 6 || date.weekday == 7) {
                  return false;
                }
                return true;
              },
              onChanged: (val) => setState(() => _tanggalController.text = val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => _tanggalController,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: showTime,
                  icon: const Icon(Icons.timer),
                ),
                Text(_jamController.text),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tempat Kegiatan",
                ),
                TextField(
                  controller: _tempatController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        'nama_kegiatan': _nameKegiatanController.text,
                        'detail_kegiatan': _detailKegiatanController.text,
                        'tanggal': _tanggalController.text,
                        'jam': _jamController.text,
                        'tempat': _tempatController.text,
                      };

                      await SceduleService()
                          .updateSchedule(body, schedule.id)
                          .then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return navbar(index: 1);
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully update a scedule')));
                      });
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Color.fromRGBO(
                          254,
                          204,
                          118,
                          1,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 0, 0, 0),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

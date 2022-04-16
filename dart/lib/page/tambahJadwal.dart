import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/page/jadwalPage.dart';

class tambahJadwal extends StatefulWidget {
  const tambahJadwal({Key? key}) : super(key: key);

  @override
  State<tambahJadwal> createState() => _tambahJadwalState();
}

class _tambahJadwalState extends State<tambahJadwal> {
  TimeOfDay time = TimeOfDay.now();
  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 60, right: 16, left: 16),
            height: 70,
            child: Row(
              children: [
                IconButton(
                    onPressed: () => setState(() {
                          jadwalPage();
                        }),
                    icon: Icon(Icons.undo))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Nama Kegiatan",
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
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
              children: const [
                Text(
                  "Detail Kegiatan",
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
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
              initialValue: DateTime.now().toString(),
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
              onChanged: (val) => print(val),
              validator: (val) {
                print(val);
                return null;
              },
              onSaved: (val) => print(val),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: showTime,
                  icon: new Icon(Icons.timer),
                ),
                Text(time.format(context).toString()),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Tempat Kegiatan",
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

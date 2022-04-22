import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';


class uploadPayment extends StatefulWidget {
  const uploadPayment({Key? key}) : super(key: key);

  @override
  State<uploadPayment> createState() => _uploadPayment();
}

class _uploadPayment extends State<uploadPayment> {

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
        appBar: AppBar(

          title: const Text(
            "Upload Pembayaran",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color.fromRGBO(246, 246, 246, 1),
        ),
        body: ListView(children: [
          Container(
            margin: const EdgeInsets.only(top: 30, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Nominal Pembayaran",
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
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
              dateLabelText: 'Tanggal Pembayaran',
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

          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
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
                Text(time.format(context).toString()),
              ],
            ),
          )
        ]));
  }
}

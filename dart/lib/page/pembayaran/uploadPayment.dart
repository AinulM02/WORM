import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/page/pembayaran/detailPayment.dart';
import 'package:worm/service/paymentDetailService.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/widgets/date.dart';
import 'package:intl/intl.dart';
import 'package:worm/model/paymentModel.dart';

class uploadPayment extends StatefulWidget {
  static final url = "/upload-payment";
  const uploadPayment({Key? key}) : super(key: key);

  @override
  State<uploadPayment> createState() => _uploadPayment();
}

class _uploadPayment extends State<uploadPayment> {
  TextEditingController _bayarController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _id_paymentController = TextEditingController();
  TextEditingController _jamController = TextEditingController();

  DateTime tanggal = DateTime.now();
  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  Future<Null> _selectDate(BuildContext context) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tanggal,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tanggal)
      setState(() {
        _tanggalController.text = picked.toString();
        tanggal = picked;
      });
  }

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
    final payments payment =
        ModalRoute.of(context)!.settings.arguments as payments;

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
                  controller: _bayarController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
          //   child: DateTimePicker(
          //     dateMask: 'd MMM, yyyy',
          //     initialValue: DateTime.now().toString(),
          //     firstDate: DateTime(2000),
          //     lastDate: DateTime(2100),
          //     icon: const Icon(Icons.event),
          //     dateLabelText: 'Tanggal Pembayaran',
          //     selectableDayPredicate: (date) {
          //       // Disable weekend days to select from the calendar
          //       if (date.weekday == 6 || date.weekday == 7) {
          //         return false;
          //       }
          //       return true;
          //     },
          //     onChanged: (val) => print(val),
          //     validator: (val) {
          //       print(val);
          //       return null;
          //     },
          //     onSaved: (val) => print(val),
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: DateDropDown(
              labelText: "tanggal kegiatan",
              valueText: DateFormat.yMd().format(tanggal),
              valueStyle: valueStyle,
              onPressed: () {
                _selectDate(context);
              },
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
                Text(_jamController.text),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      Map<String, dynamic> body = {
                        'bayar': _bayarController.text,
                        'tanggal': _tanggalController.text,
                        'id_payment': payment.id.toString(),
                        'jam': _jamController.text,
                      };

                      await PaymentDetailService()
                          .createPaymentDetail(body)
                          .then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return navbar(index: 2);
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully upload a payment')));
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
        ]));
  }
}

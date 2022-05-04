// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/model/paymentDetailModel.dart';
import 'package:worm/page/pembayaran/payment.dart';
import 'package:worm/page/pembayaran/detailPayment.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/service/paymentDetailService.dart';
import 'package:worm/widgets/date.dart';
import 'package:intl/intl.dart';

class editDetailPayment extends StatefulWidget {
  static final url = "/editDetail-payment";
  const editDetailPayment({Key? key}) : super(key: key);

  @override
  State<editDetailPayment> createState() => _tambahDetailPaymentState();
}

class _tambahDetailPaymentState extends State<editDetailPayment> {
  TextEditingController _bayarController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _idPaymentController = TextEditingController();
  TextEditingController _jamController = TextEditingController();
  bool cek = false;

  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
  DateTime tanggal = DateTime.now();
  Future<Null> _selectDate(BuildContext context, DateTime tgl) async {
    // Initial DateTime FIinal Picked
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: tgl,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));

    if (picked != null && picked != tgl)
      setState(() {
        _tanggalController.text = picked.toString();
        tanggal = picked;
        cek = true;
      });
  }

  TimeOfDay time = TimeOfDay.now();
  void showTime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _jamController.text = value!.format(context).toString();
        cek = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final PaymentDetails Detailpayment =
        ModalRoute.of(context)!.settings.arguments as PaymentDetails;

    if (Detailpayment != null && !cek) {
      _bayarController.text = Detailpayment.bayar;
      _tanggalController.text = Detailpayment.tanggal.toString();
      _idPaymentController.text = Detailpayment.idPayment.toString();
      _jamController.text = Detailpayment.jam;
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
                  "Edit Detail Pembayaran",
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
                  "Nominal Pembayaran",
                ),
                TextField(
                  controller: _bayarController,
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
              children: [
                Divider(
                  color: Colors.black,
                ),
                DateDropDown(
                  labelText: "tanggal Kegiatan",
                  valueText: DateFormat.yMd().format(tanggal),
                  valueStyle: valueStyle,
                  onPressed: () {
                    _selectDate(context, Detailpayment.tanggal);
                  },
                ),
              ],
            ),
          ),
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(children: [
              Divider(
                color: Colors.black,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Text("Jam"),
                    IconButton(
                      onPressed: showTime,
                      icon: const Icon(Icons.timer),
                    ),
                  ]),
                  Text("\n\n" + _jamController.text),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
            ]),
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
                        'id_payment': _idPaymentController.text,
                        'jam': _jamController.text,
                      };

                      await PaymentDetailService()
                          .updatePaymentDetail(body, Detailpayment.id)
                          .then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return navbar(index: 2);
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text(
                                'You have successfully update a detail payment')));
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

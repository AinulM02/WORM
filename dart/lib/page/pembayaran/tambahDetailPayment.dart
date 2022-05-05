import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/page/pembayaran/detailPayment.dart';
import 'package:worm/service/paymentDetailService.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/widgets/date.dart';
import 'package:intl/intl.dart';
import 'package:worm/model/paymentModel.dart';
import 'package:worm/page/jadwalPage.dart';
import 'package:worm/service/paymentService.dart';

class uploadPayment extends StatefulWidget {
  static final url = "/tambahDetail-payment";
  const uploadPayment({Key? key}) : super(key: key);

  @override
  State<uploadPayment> createState() => _uploadPayment();
}

class _uploadPayment extends State<uploadPayment> {
  //untuk tabel detail_pembayaran
  TextEditingController _bayarController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _id_paymentController = TextEditingController();
  TextEditingController _jamController = TextEditingController();

  //untuk tabel pembayaran
  TextEditingController _nameVendorController = TextEditingController();
  TextEditingController _tunaiKeseluruhanController = TextEditingController();
  TextEditingController _tanggalPaymentController = TextEditingController();
  TextEditingController _tunaiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  //untuk menyimpan sementara nilai dari total pembayaran
  int total = 0;

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

    if (payment != null) {
      _nameVendorController.text = payment.namaVendor;
      _tunaiKeseluruhanController.text = payment.tunaiKeseluruhan;
      _tanggalPaymentController.text = payment.tanggal.toString();
      _tunaiController.text = payment.tunai;
      // _tunaiController.text = "10k ae lah";
      _keteranganController.text = payment.keterangan;
    }

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
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(children: [
              Divider(
                color: Colors.black,
              ),
              DateDropDown(
                labelText: "tanggal kegiatan",
                valueText: DateFormat.yMd().format(tanggal),
                valueStyle: valueStyle,
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ]),
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
          SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, right: 20),
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      //untuk menyimpan data dari upload pembayaran
                      Map<String, dynamic> body = {
                        'bayar': _bayarController.text,
                        'tanggal': _tanggalController.text,
                        'id_payment': payment.id.toString(),
                        'jam': _jamController.text,
                      };
                      //untuk menyimpan data dari upload pembayaran
                      await PaymentDetailService().createPaymentDetail(body);

                      total = int.parse(_tunaiController.text) +
                          int.parse(_bayarController.text);
                      if (total ==
                          int.parse(_tunaiKeseluruhanController.text)) {
                        _keteranganController.text = "lunas";
                      }

                      //untuk update data pada tabel payment kolom tunai
                      Map<String, dynamic> body1 = {
                        'nama_vendor': _nameVendorController.text,
                        'tunai_keseluruhan': _tunaiKeseluruhanController.text,
                        'tanggal': _tanggalPaymentController.text,
                        'tunai': total.toString(),
                        'keterangan': _keteranganController.text,
                      };
                      //untuk update data pada tabel payment kolom tunai
                      await PaymentService()
                          .updatePayment(body1, payment.id)
                          .then((value) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return navbar(index: 2);
                        }));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(
                                    'You have successfully update a payment')));
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

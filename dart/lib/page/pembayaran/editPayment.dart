// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:worm/model/paymentModel.dart';
import 'package:worm/page/pembayaran/payment.dart';
import 'package:worm/page/pembayaran/detailPayment.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/service/paymentService.dart';
import 'package:worm/widgets/date.dart';
import 'package:intl/intl.dart';

class editPayment extends StatefulWidget {
  static final url = "/edit-payment";
  const editPayment({Key? key}) : super(key: key);

  @override
  State<editPayment> createState() => _tambahPaymentState();
}

class _tambahPaymentState extends State<editPayment> {
  TextEditingController _nameVendorController = TextEditingController();
  TextEditingController _tunaiKeseluruhanController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _tunaiController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  final TextStyle valueStyle = TextStyle(fontSize: 16.0);
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
      });
  }

  @override
  Widget build(BuildContext context) {
    final payments payment =
        ModalRoute.of(context)!.settings.arguments as payments;

    if (payment != null) {
      _nameVendorController.text = payment.namaVendor;
      _tunaiKeseluruhanController.text = payment.tunaiKeseluruhan;
      _tanggalController.text = payment.tanggal.toString();
      _tunaiController.text = payment.tunai;
      _keteranganController.text = payment.keterangan;
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
                  controller: _nameVendorController,
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
                  controller: _tunaiKeseluruhanController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: DateDropDown(
              labelText: "tanggal kegiatan",
              valueText: DateFormat.yMd().format(payment.tanggal),
              valueStyle: valueStyle,
              onPressed: () {
                _selectDate(context, payment.tanggal);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, right: 16, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tunai",
                ),
                TextField(
                  controller: _tunaiController,
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
                  "Tempat Kegiatan",
                ),
                TextField(
                  controller: _keteranganController,
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
                        'nama_vendor': _nameVendorController.text,
                        'tunai_keseluruhan': _tunaiKeseluruhanController.text,
                        'tanggal': _tanggalController.text,
                        'tunai': _tunaiController.text,
                        'keterangan': _keteranganController.text,
                      };

                      await PaymentService()
                          .updatePayment(body, payment.id)
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
        ],
      ),
    );
  }
}

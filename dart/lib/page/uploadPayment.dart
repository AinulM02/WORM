import 'package:flutter/material.dart';

class uploadPayment extends StatefulWidget {
  const uploadPayment({Key? key}) : super(key: key);

  @override
  State<uploadPayment> createState() => _uploadPayment();
}

class _uploadPayment extends State<uploadPayment> {
  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as int;
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
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        child: new Column(
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                  hintText: "Masukkan Nominal",
                  labelText: "Minimal Pembayaran",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: "Tanggal Pembayaran",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
            ),
            new Padding(
              padding: new EdgeInsets.only(top: 20.0),
            ),
            new TextField(
              decoration: new InputDecoration(
                  labelText: "Waktu Pembayaran",
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
            ),
          ],
        ),
      ),
    );
  }
}

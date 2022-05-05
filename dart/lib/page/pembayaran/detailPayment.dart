import 'dart:async';

import 'package:flutter/material.dart';
import 'package:worm/page/pembayaran/detailPayment.dart';
import 'package:worm/model/paymentDetailModel.dart';
import 'package:worm/page/pembayaran/tambahPayment.dart';
import 'package:worm/service/paymentDetailService.dart';
import 'package:worm/model/paymentModel.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:worm/service/paymentService.dart';
import 'package:worm/widgets/navbar.dart';
import 'package:worm/page/pembayaran/editPayment.dart';
import 'package:worm/page/pembayaran/editDetailPayment.dart';
import 'package:worm/page/pembayaran/tambahDetailPayment.dart';
import 'package:intl/intl.dart';
import 'package:worm/format/formatAngka.dart';
import 'package:url_launcher/url_launcher.dart';

class detailPayment extends StatefulWidget {
  static final url = "/detail-payment";
  const detailPayment({Key? key}) : super(key: key);

  @override
  State<detailPayment> createState() => _detailPayment();
}

class _detailPayment extends State<detailPayment> {
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  late Future<PaymentDetail> _payments;
  int id = 0;

  @override
  void initState() {
    super.initState();
    _payments = PaymentDetailService().getAllPaymentDetail();
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
    final payments payment =
        ModalRoute.of(context)!.settings.arguments as payments;
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.black,
        animatedIcon: AnimatedIcons.menu_arrow,
        children: [
          SpeedDialChild(
              child: Icon(Icons.edit),
              onTap: () {
                Navigator.pushNamed(context, editPayment.url,
                    arguments: payment);
              }),
          SpeedDialChild(
              child: Icon(Icons.delete),
              onTap: () async {
                await PaymentService().deletePayment(payment.id).then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return navbar(index: 2);
                  }));
                });
              }),
        ],
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(18.0)),
            Padding(padding: EdgeInsets.only(top: 8)),
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
                    "Detail Pembayaran",
                    style: TextStyle(
                      color: Color.fromARGB(255, 24, 24, 24),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 20)),
                  IconButton(
                      alignment: Alignment.bottomRight,
                      color: Colors.amber,
                      onPressed: () {
                        Navigator.pushNamed(context, uploadPayment.url,
                            arguments: payment);
                      },
                      icon: const Icon(Icons.add)),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 16, left: 16, bottom: 8),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Container(
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
                child: ListView(
                  children: [
                    ListTile(
                      title: Text(payment.namaVendor),
                      subtitle: Text(
                        formatAngka.convertToIdr(
                            int.parse(payment.tunaiKeseluruhan), 2),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Column(
                            children: [
                              Text(payment.tanggal.toString()),
                              SizedBox(
                                height: 5,
                              ),
                              payment.keterangan != "lunas"
                                  ? Text(
                                      payment.keterangan,
                                      style: TextStyle(color: Colors.red),
                                    )
                                  : Text(
                                      payment.keterangan,
                                      style: TextStyle(color: Colors.green),
                                    ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    const Divider(
                      color: Colors.grey,
                    ),
                    FutureBuilder(
                      future: _payments,
                      builder:
                          (context, AsyncSnapshot<PaymentDetail> snapshot) {
                        var state = snapshot.connectionState;
                        if (state != ConnectionState.done) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var payment_detail = snapshot.data!.data[index];
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, editDetailPayment.url,
                                          arguments: payment_detail);
                                    },
                                    child:
                                        payment_detail.idPayment == payment.id
                                            ? listItem(payment_detail)
                                            : SizedBox());
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
                  ],
                ),
              ),
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(right: 16, left: 16),
                height: 50,
                width: 400,
                child: Container(
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
                      children: const [
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Lihat bukti Pembayaran",
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
              onTap: () async {
                const url =
                    'https://drive.google.com/drive/folders/1x8Xm3ZZsXvXXshcj3p47pBiNMb0Eqme1?usp=sharing';
                launchURL(url);
              },
            ),
          ]),
    );
  }

  Widget listItem(PaymentDetails paymentDetail) {
    String tanggal = DateFormat.yMd().format(paymentDetail.tanggal);

    return Container(
        child: Column(
      children: [
        ListTile(
          title:
              Text(formatAngka.convertToIdr(int.parse(paymentDetail.bayar), 2)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
                  Text(tanggal, style: TextStyle(color: Color(0xFF828282))),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    paymentDetail.jam,
                    style: TextStyle(color: Color(0xFF828282)),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
      ],
    ));
  }
}

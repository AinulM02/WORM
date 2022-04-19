import 'package:flutter/material.dart';
import 'package:worm/widgets/navbar.dart';

class detailJadwal extends StatefulWidget {
  const detailJadwal({Key? key}) : super(key: key);

  @override
  State<detailJadwal> createState() => _detailJadwalState();
}

class _detailJadwalState extends State<detailJadwal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              return const navbar();
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
                    Text("Nama      :"),
                    Text("   Ainul M"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Tanggal  :"),
                    Text("   Kamis, 20 April 2022"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Waktu      :"),
                    Text("   14.00 WIB"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  children: [
                    Text("Kegiatan :"),
                    Text("   Meeting dengan Customer"),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, top: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detail       :"),
                    Flexible(
                      child: Text(
                        "   Kedua mempelai diharapkan hadir untuk bertemu dengan pihak WO",
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
                        "   Kantor Alvia, Jalan Raya Sambung - Kecamatan Diwek Kabupaten Jombang - Jawa Timur",
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

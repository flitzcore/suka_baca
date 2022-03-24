import 'package:flutter/material.dart';
import 'package:baca_suka/Pages/route_page.dart';
import 'package:baca_suka/Pages/tambahrangkuman_page.dart';
import 'package:baca_suka/database/rangkuman.dart';
import 'package:baca_suka/database/rangkuman_database.dart';

import '../Utility/theme.dart';
import '../Widget/genre_widget.dart';
import '../Widget/progress_widget.dart';

class RangkumanPage extends StatefulWidget {
  final int rid;
  const RangkumanPage({
    Key? key,
    required this.rid,
  }) : super(key: key);

  @override
  State<RangkumanPage> createState() => _RangkumanPageState();
}

class _RangkumanPageState extends State<RangkumanPage> {
  late Rangkuman rangkuman;
  bool isLoading = false;
  List<Widget> genre=[];
  void fillGenre(){
    genre.clear();
    genre.add(SizedBox());
    if(rangkuman.horror)genre.add(horror);
    if(rangkuman.petualangan)genre.add(petualangan);
    if(rangkuman.pengenalan_diri)genre.add(pengenalanDiri);
    if(rangkuman.komedi)genre.add(komedi);
    if(rangkuman.romansa)genre.add(romansa);
    if(rangkuman.fiksi)genre.add(fiksi);
    if(rangkuman.thriller)genre.add(thriller);
    if(rangkuman.misteri)genre.add(misteri);
  }
  @override
  void initState() {
    super.initState();

    refreshNote();
  }
  Future refreshNote() async {
    setState(() => isLoading = true);

    this.rangkuman = await RangkumanDatabase.instance.readRangkuman(widget.rid);

    setState(() => isLoading = false);
  }
  final itemsGenre = [
    horror,
    petualangan,
    pengenalanDiri,
    komedi,
    romansa,
    fiksi,
    thriller,
    misteri,
  ];

  final itemsProgress = [
    on_progress,
    selesai,
  ];
  @override
  Widget build(BuildContext context) {
  fillGenre();
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            :Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 25,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    size: 25,
                    color: redColor,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 3),
                    color: whiteColor),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        rangkuman.judul.toString(),
                        style: semiBlackBoldTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "by ${rangkuman.nama_pengarang.toString()}",
                        style: lightTextStyle.copyWith(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: genre
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          on_progress,
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        rangkuman.deskripsi.toString(),
                        style: regularBlackTextSTyle.copyWith(fontSize: 14),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(blackColor),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TambahRangkumanPage(rangkuman: rangkuman,),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        child: Text(
                          "Edit",
                          style: semiWhiteBoldTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(redColor),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                        ),
                      ),
                      onPressed: () => showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text(
                            "Hapus Rangkuman?",
                            style: semiBlackBoldTextStyle,
                          ),
                          content: SingleChildScrollView(
                            child: ListBody(children: [
                              Text(
                                "Rangkuman ini akan dihapus secara permanen. Pastikan anda yakin ingin menghapus rangkuman ini.",
                                style: regularBlackTextSTyle.copyWith(
                                  fontSize: 12,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ]),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () async {
                                await RangkumanDatabase.instance.delete(widget.rid);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const RoutePage()),
                                );
                                },
                              child: Text(
                                "Ya",
                                style: mediumBlackTextSTyle.copyWith(),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Tidak",
                                style: mediumBlackTextSTyle.copyWith(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                        ),
                        child: Text(
                          "Hapus",
                          style: semiWhiteBoldTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

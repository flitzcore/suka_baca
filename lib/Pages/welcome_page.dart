import 'package:flutter/material.dart';
import 'package:baca_suka/Pages/route_page.dart';
import 'package:baca_suka/Utility/button_1.dart';
import 'package:baca_suka/Utility/kumpulan_text.dart';
import 'package:baca_suka/Utility/slider_rect.dart';
import 'package:baca_suka/Utility/theme.dart';

class WelcomePages extends StatefulWidget {
  const WelcomePages({Key? key}) : super(key: key);

  @override
  _WelcomePagesState createState() => _WelcomePagesState();
}

class _WelcomePagesState extends State<WelcomePages> {
  @override
  List img = ["welcomepage_1.png", "welcomepage_2.png", "welcomepage_3.png"];
  List textBold = [
    "Buku adalah Jendela Ilmu",
    "Catat Setiap Hal Penting",
    "Kemudahan Merangkum Buku Kesukaanmu"
  ];
  List textBody = [
    "Luangkan waktumu untuk membaca buku setiap hari",
    "Simpan setiap progress dan hal penting dari buku yang telah dibaca",
    "Berhenti membuang waktu membaca buku kesukaanmu berulang kali"
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: PageView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: img.length,
          itemBuilder: (_, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(left: 20.0, right: 20, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeText(text: textBold[index]),
                      BodyText(text: textBody[index]),
                    ],
                  ),
                ),
                Container(
                    width: double.maxFinite - 10,
                    height: MediaQuery.of(context).size.width - 10,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/img/" + img[index]),
                          fit: BoxFit.cover,
                          filterQuality: FilterQuality.high),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SliderBar(pages: img.length, pagesIndex: index)
                    ]),
                Container(
                  height: 50,
                  width: double.maxFinite - 30,
                  margin: const EdgeInsets.only(left: 50, right: 50),
                  child: (index == 2)
                      ? Button1(
                          text: "Jelajahi Sekarang",
                          onButtonPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RoutePage()),
                            );
                          },
                        )
                      : (Container()),
                ),
              ],
            );
          }),
    );
  }
}

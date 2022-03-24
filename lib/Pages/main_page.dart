import 'package:flutter/material.dart';
import 'package:baca_suka/Pages/search_page.dart';
import 'package:baca_suka/Utility/kumpulan_text.dart';
import 'package:baca_suka/Widget/genre_widget.dart';
import 'package:baca_suka/Widget/progress_widget.dart';
import 'package:baca_suka/Widget/rangkuman_card.dart';
import 'package:baca_suka/database/rangkuman.dart';
import 'package:baca_suka/database/rangkuman_database.dart';
import '../Utility/theme.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<Rangkuman> rangkuman;

  bool isLoading = false;

  void initState() {
    super.initState();
    refreshList();
  }

  Future refreshList() async {
    setState(() => isLoading = true);
    this.rangkuman = await RangkumanDatabase.instance.readAll();
    setState(() => isLoading = false);

  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: isLoading?Center(child: CircularProgressIndicator()):
            rangkuman.isEmpty?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  "SukaBaca",
                  style: semiBlackBoldTextStyle.copyWith(
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // TextField(

                Text(
                  "Rangkumanmu",
                  style: semiBlackBoldTextStyle.copyWith(
                    fontSize: 16,
                  ),
                ),
                BodyText(text: "Belum ada rangkuman, Ayo mulai menambahkan.."),
              ],
            ):
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              "SukaBaca",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // TextField(

            Text(
              "Rangkumanmu",
              style: semiBlackBoldTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: rangkuman.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        RangkumanCard(
                          id: rangkuman[index].id!,
                          isFavorite: rangkuman[index].favorit,
                          nama_pengarang: rangkuman[index].nama_pengarang,
                          img_path: rangkuman[index].image_path,
                          judul: rangkuman[index].judul,
                          onProgress: rangkuman[index].onProgress,
                          horror: rangkuman[index].horror,
                          petualangan: rangkuman[index].petualangan,
                          pengenalan_diri: rangkuman[index].pengenalan_diri,
                          komedi: rangkuman[index].komedi,
                          romansa: rangkuman[index].romansa,
                          fiksi: rangkuman[index].fiksi,
                          thriller: rangkuman[index].thriller,
                          misteri: rangkuman[index].misteri,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

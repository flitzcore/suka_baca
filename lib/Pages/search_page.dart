import 'package:flutter/material.dart';
import 'package:baca_suka/Utility/theme.dart';
import 'package:baca_suka/Widget/rangkuman_card.dart';
import 'package:baca_suka/database/rangkuman.dart';
import 'package:baca_suka/database/rangkuman_database.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<Rangkuman> rangkuman;
  List<Rangkuman> rangkumanTemp=[];
  String query = '';
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
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
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
            TextField(

              style: TextStyle(
                color: greyColor,
              ),
              decoration: InputDecoration(
                fillColor: greyColor,
                focusColor: greyColor,
                suffixIcon: Icon(Icons.search),
                suffixIconColor: greyColor,
                hintText: "Search",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: blackColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: blackColor,
                  ),
                ),
              ),
              onChanged: (query){
                searchBook(query);
              },
            ),
            Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: rangkumanTemp.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        RangkumanCard(
                          id: rangkumanTemp[index].id!,
                          isFavorite: rangkumanTemp[index].favorit,
                          nama_pengarang: rangkumanTemp[index].nama_pengarang,
                          img_path: rangkumanTemp[index].image_path,
                          judul: rangkumanTemp[index].judul,
                          onProgress: rangkumanTemp[index].onProgress,
                          horror: rangkumanTemp[index].horror,
                          petualangan: rangkumanTemp[index].petualangan,
                          pengenalan_diri: rangkumanTemp[index].pengenalan_diri,
                          komedi: rangkumanTemp[index].komedi,
                          romansa: rangkumanTemp[index].romansa,
                          fiksi: rangkumanTemp[index].fiksi,
                          thriller: rangkumanTemp[index].thriller,
                          misteri: rangkumanTemp[index].misteri,
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
      )),
    );
  }
  void searchBook(String query) {
    print("query: ${query}");
    final books = rangkuman.where((book) {
      final titleLower = book.judul.toLowerCase();
      final authorLower = book.nama_pengarang.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          authorLower.contains(searchLower);
    }).toList();
  //  print(books);
    setState(() {
      this.query = query;
      this.rangkumanTemp = books;

    });
  }
}

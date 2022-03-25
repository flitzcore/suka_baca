import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:baca_suka/Pages/route_page.dart';
import 'package:baca_suka/Utility/theme.dart';
import 'package:baca_suka/Widget/genre_widget.dart';
import 'package:baca_suka/Widget/progress_widget.dart';
import 'package:baca_suka/database/rangkuman.dart';
import 'package:baca_suka/database/rangkuman_database.dart';

class TambahRangkumanPage extends StatefulWidget {
  final Rangkuman? rangkuman;
  const TambahRangkumanPage({Key? key, this.rangkuman}) : super(key: key);

  @override
  State<TambahRangkumanPage> createState() => _TambahRangkumanPageState();
}

class _TambahRangkumanPageState extends State<TambahRangkumanPage> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imagePermanent = await saveImagePermanently(image.path);
      setState(() => {
            this.image = imagePermanent,
          });
    } on PlatformException catch (e) {
      print('Failed to fetch img: $e');
    }
  }

  Future<File> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagePath);
    final image = File('${directory.path}/${name}');
    setState(() => {
          this.img_path = image.path,
        });
    return File(imagePath).copy(image.path);
  }

  final _formKey = GlobalKey<FormState>();
  late bool favorit;
  late String judul;
  late String pengarang;
  late String deskripsi;
  late String img_path;
  late bool progress;

  //genre
  late bool b_horror;
  late bool b_petualangan;
  late bool b_pengenalan_diri;
  late bool b_komedi;
  late bool b_romansa;
  late bool b_fiksi;
  late bool b_thriller;
  late bool b_misteri;

  @override
  void initState() {
    super.initState();
    favorit = widget.rangkuman?.favorit ?? false;
    judul = widget.rangkuman?.judul ?? '';
    pengarang = widget.rangkuman?.nama_pengarang ?? '';
    deskripsi = widget.rangkuman?.deskripsi ?? '';
    img_path = widget.rangkuman?.image_path ?? '';
    progress = widget.rangkuman?.onProgress ?? false;
    b_horror = widget.rangkuman?.horror ?? false;
    b_petualangan = widget.rangkuman?.petualangan ?? false;
    b_pengenalan_diri = widget.rangkuman?.pengenalan_diri ?? false;
    b_komedi = widget.rangkuman?.komedi ?? false;
    b_romansa = widget.rangkuman?.romansa ?? false;
    b_fiksi = widget.rangkuman?.fiksi ?? false;
    b_thriller = widget.rangkuman?.thriller ?? false;
    b_misteri = widget.rangkuman?.misteri ?? false;
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
  int _StatusVal = 0;
  String statusText = "Status";
  Widget build(BuildContext context) {
    print(_StatusVal);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 20,
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
                  IconButton(
                    onPressed: () {
                      setState(() {
                        favorit = !favorit;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 25,
                      color: favorit ? redColor : greyColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: judul,
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintText: "Judul",
                  hintStyle: lightTextStyle,
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
                onChanged: (text) {
                  setState(() {
                    this.judul = text;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                initialValue: pengarang,
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintText: "Pengarang",
                  hintStyle: lightTextStyle,
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
                onChanged: (text) {
                  setState(() {
                    this.pengarang = text;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 3,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GenreSelector(
                          genre: horror,
                          checkValue: b_horror,
                          onChecked: (_isHorror) {
                            setState(() {
                              b_horror = _isHorror;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: petualangan,
                          checkValue: b_petualangan,
                          onChecked: (_isPetualangan) {
                            setState(() {
                              b_petualangan = _isPetualangan;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: pengenalanDiri,
                          checkValue: b_pengenalan_diri,
                          onChecked: (_isPengenalanDiri) {
                            setState(() {
                              b_pengenalan_diri = _isPengenalanDiri;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: komedi,
                          checkValue: b_komedi,
                          onChecked: (_isKomedi) {
                            setState(() {
                              b_komedi = _isKomedi;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: romansa,
                          checkValue: b_romansa,
                          onChecked: (_isRomansa) {
                            setState(() {
                              b_romansa = _isRomansa;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: fiksi,
                          checkValue: b_fiksi,
                          onChecked: (_isFiksi) {
                            setState(() {
                              b_fiksi = _isFiksi;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: thriller,
                          checkValue: b_thriller,
                          onChecked: (_isThriller) {
                            setState(() {
                              b_thriller = _isThriller;
                            });
                          },
                        ),
                        GenreSelector(
                          genre: misteri,
                          checkValue: b_misteri,
                          onChecked: (_isMisteri) {
                            setState(() {
                              b_misteri = _isMisteri;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      "Genre",
                      style: lightTextStyle,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              ElevatedButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 3,
                      ),
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            on_progress,
                            Radio(
                              activeColor: blackColor,
                              value: 1,
                              groupValue: _StatusVal,
                              onChanged: (int? value) {
                                setState(() {
                                  _StatusVal = value!;
                                  print(_StatusVal);
                                  (_StatusVal == 1)
                                      ? progress = true
                                      : progress = false;
                                  statusText = "On Progress";
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            selesai,
                            Radio(
                              activeColor: blackColor,
                              value: 2,
                              groupValue: _StatusVal,
                              onChanged: (int? value) {
                                setState(() {
                                  _StatusVal = value!;
                                  print(_StatusVal);
                                  (_StatusVal == 1)
                                      ? progress = true
                                      : progress = false;
                                  statusText = "Selesai";
                                  Navigator.pop(context);
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    Text(
                      statusText,
                      style: lightTextStyle,
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(
                              color: blackColor,
                              width: 3,
                            ),
                          ),
                          title: Text(
                            "Pilih gambar",
                            style: semiBlackBoldTextStyle,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                pickImage(ImageSource.gallery);
                              },
                              child: Text(
                                "Galeri",
                                style: mediumBlackTextSTyle.copyWith(),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                              child: Text(
                                "Kamera",
                                style: mediumBlackTextSTyle.copyWith(),
                              ),
                            ),
                          ],
                        )),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4,
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Gambar",
                        style: lightTextStyle,
                      ),
                      Spacer(),
                      Icon(
                        Icons.camera,
                        color: greyColor,
                      ),
                    ],
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: blackColor,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ),
              image != null
                  ? Image.file(
                      image!,
                      width: 61,
                      height: 93,
                      fit: BoxFit.cover,
                    )
                  : SizedBox(
                      height: 40,
                    ),
              TextFormField(
                initialValue: deskripsi,
                maxLines: null,
                style: TextStyle(
                  color: greyColor,
                ),
                decoration: InputDecoration(
                  fillColor: greyColor,
                  focusColor: greyColor,
                  hintText: "Rangkuman",
                  hintStyle: lightTextStyle.copyWith(),
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
                onChanged: (text) {
                  setState(() {
                    this.deskripsi = text;
                  });
                },
              ),
              SizedBox(
                height: 60,
              ),
              ElevatedButton(
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
                  addOrUpdateNote();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 6,
                  ),
                  child: Text(
                    "Simpan",
                    style: semiWhiteBoldTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              //TEST
            ],
          ),
        ),
      ),
    );
  }

  void addOrUpdateNote() async {
    print("debug");
    //final isValid = _formKey.currentState!.validate();
    // if (isValid) {
    final isUpdating = widget.rangkuman != null;

    if (isUpdating) {
      await updateNote();
    } else {
      await addNote();
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoutePage()),
    );
    //}
  }

  Future updateNote() async {
    final note = widget.rangkuman!.copy(
        favorit: favorit,
        judul: judul,
        nama_pengarang: pengarang,
        deskripsi: deskripsi,
        image_path: img_path,
        onProgress: progress,
        horror: b_horror,
        petualangan: b_petualangan,
        pengenalan_diri: b_pengenalan_diri,
        komedi: b_komedi,
        romansa: b_romansa,
        fiksi: b_fiksi,
        thriller: b_thriller,
        misteri: b_misteri);

    await RangkumanDatabase.instance.update(note);
  }

  Future addNote() async {
    final rangkuman = Rangkuman(
        favorit: favorit,
        judul: judul,
        nama_pengarang: pengarang,
        deskripsi: deskripsi,
        image_path: img_path,
        onProgress: progress,
        horror: b_horror,
        petualangan: b_petualangan,
        pengenalan_diri: b_pengenalan_diri,
        komedi: b_komedi,
        romansa: b_romansa,
        fiksi: b_fiksi,
        thriller: b_thriller,
        misteri: b_misteri);

    await RangkumanDatabase.instance.create(rangkuman);
  }

  DropdownMenuItem<Container> buildItem(Container item) => DropdownMenuItem(
        value: item,
        child: Container(child: item),
      );
}

class GenreSelector extends StatefulWidget {
  const GenreSelector({
    Key? key,
    required this.genre,
    required this.checkValue,
    required this.onChecked,
  }) : super(key: key);

  final Widget genre;
  final Function(bool) onChecked;
  final bool checkValue;

  @override
  State<GenreSelector> createState() => _GenreSelectorState();
}

class _GenreSelectorState extends State<GenreSelector> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.checkValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.genre,
        Checkbox(
          side: BorderSide(
            color: blackColor,
            width: 2,
          ),
          activeColor: blackColor,
          shape: const CircleBorder(),
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value!;
              widget.onChecked(isChecked);
            });
          },
        ),
      ],
    );
  }
}

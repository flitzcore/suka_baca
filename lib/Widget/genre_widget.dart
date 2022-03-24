import 'package:flutter/material.dart';
import 'package:baca_suka/Utility/theme.dart';

final horror = Container(
  decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: blackColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Horror",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final petualangan = Container(
  decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: redColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Petualangan",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final pengenalanDiri = Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: yellowColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Pengenalan Diri",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final komedi = Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: greeenColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Komedi",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final romansa = Container(
  decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: pinkColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Romansa",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final fiksi = Container(
  decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(12), color: blueColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Fiksi",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final thriller = Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: purpleColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Thriller",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

final misteri = Container(
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12), color: lightPurpleColor),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Text(
      "Misteri",
      style: mediumWhiteTextSTyle.copyWith(
        fontSize: 12,
      ),
    ),
  ),
);

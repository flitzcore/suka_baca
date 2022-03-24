import 'package:flutter/material.dart';
import 'package:baca_suka/Utility/theme.dart';

final on_progress = Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: whiteColor,
    border: Border.all(
      width: 2,
      color: blackColor,
    ),
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Row(
      children: [
        Text(
          "On Progress",
          style: mediumBlackTextSTyle.copyWith(
            fontSize: 12,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.timer,
          size: 16,
          color: yellowColor,
        ),
      ],
    ),
  ),
);

final selesai = Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: whiteColor,
    border: Border.all(
      width: 2,
      color: blackColor,
    ),
  ),
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
    child: Row(
      children: [
        Text(
          "Selesai",
          style: mediumBlackTextSTyle.copyWith(
            fontSize: 12,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Icon(
          Icons.check,
          size: 16,
          color: greeenColor,
        ),
      ],
    ),
  ),
);

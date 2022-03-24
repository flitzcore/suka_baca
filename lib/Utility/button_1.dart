import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:baca_suka/Utility/theme.dart';

import 'kumpulan_text.dart';

class Button1 extends StatelessWidget {
  final String text;
  final VoidCallback onButtonPressed;
  double? width;
  Button1(
      {Key? key,
      this.width = 150,
      required this.text,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.black,
      ),
      child: TextButton(
        onPressed: () {
          onButtonPressed();
        },
        child: Text(
          "Continue",
          style: semiWhiteBoldTextStyle.copyWith(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:baca_suka/Utility/theme.dart';

class LargeText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  LargeText(
      {Key? key, required this.text, this.color = Colors.black, this.size = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(textStyle: semiBlackBoldTextStyle).copyWith(
        fontSize: 24,
      ),
    );
  }
}

class BodyText extends StatelessWidget {
  double size;
  final String text;
  Color color;
  BodyText(
      {Key? key, required this.text, this.color = Colors.black, this.size = 15})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: GoogleFonts.poppins(
        textStyle: lightTextStyle.copyWith(fontSize: 16),
      ),
    );
  }
}

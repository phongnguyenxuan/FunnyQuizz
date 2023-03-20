// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:something/theme/my_color.dart';

class MyInput extends StatelessWidget {
  final String question;
  final Color color;
  final double width;
  final double height;

  const MyInput({
    Key? key,
    // ignore: non_constant_identifier_names
    required this.question,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(2),
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black, width: 2),
          boxShadow: [
            const BoxShadow(
                color: Colors.black, offset: Offset(0, 0), spreadRadius: 4),
            BoxShadow(
                color: myColor().black,
                offset: const Offset(0, 0),
                spreadRadius: 2)
          ]),
      child: Center(
        child: AutoSizeText(question,
            textAlign: TextAlign.center,
            maxLines: 5,
            minFontSize: 10,
            style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInput extends StatelessWidget {
  final String number;

  const MyInput({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 180, 178, 178),
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 6), spreadRadius: 2)
          ]),
      child: Center(
        child: Text(number,
            style: GoogleFonts.fuzzyBubbles(
                textStyle: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.black))),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final ontap;
  const MyButton({
    Key? key,
    required this.text,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 1),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                offset: Offset(3, 3),
                spreadRadius: 1,
              )
            ]),
        child: Center(
            child: Text(text,
                style: GoogleFonts.fuzzyBubbles(
                    textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.black)))),
      ),
    );
  }
}

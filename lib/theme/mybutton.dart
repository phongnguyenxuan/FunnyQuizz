// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String? text;
  final Color color;
  final double width;
  final double height;
  final double fontSize;
  final IconData? icon;
  final double padding;
  // ignore: prefer_typing_uninitialized_variables
  final void Function()? ontap;
  const MyButton({
    Key? key,
    this.text,
    required this.color,
    required this.width,
    required this.height,
    required this.fontSize,
    this.ontap,
    this.icon,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    return GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.only(bottom: padding),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.black, width: 2),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    spreadRadius: 4,
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 243, 243, 243),
                    offset: Offset(0, 0),
                    spreadRadius: 2,
                  ),
                ]),
            child: text == null
                ? Center(child: Icon(icon))
                : Center(
                    child: AutoSizeText(text!,
                        maxLines: 1,
                        minFontSize: 10,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.fuzzyBubbles(
                            textStyle: TextStyle(
                                fontSize: fontSize,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)))),
          ),
        ));
  }
}

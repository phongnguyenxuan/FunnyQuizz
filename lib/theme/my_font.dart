import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFont {
  TextStyle body = GoogleFonts.fuzzyBubbles(
      textStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black));
  TextStyle header = GoogleFonts.fuzzyBubbles(
      textStyle: const TextStyle(
          fontSize: 25, fontWeight: FontWeight.w700, color: Colors.black));
  TextStyle footage = GoogleFonts.fuzzyBubbles(
      textStyle: const TextStyle(
          fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black));
}

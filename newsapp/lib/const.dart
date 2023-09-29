import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String baseUrl = 'https://newsapi.org/v2/everything?';

String token = '9b11fd50df964165a6f94c90bdb31586';

myStyle(double size, Color clr, [FontWeight? fw]) {
  return GoogleFonts.nunito(
    fontSize: size,
    color: clr,
    fontWeight: fw,
  );
}

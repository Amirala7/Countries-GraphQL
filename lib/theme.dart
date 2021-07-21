import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
  headline3: GoogleFonts.montserrat(
      fontSize: 22, fontWeight: FontWeight.bold, color: Colors.grey[800]),
  headline4: GoogleFonts.montserrat(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
  headline5: GoogleFonts.montserrat(
      fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[800]),
  headline6: GoogleFonts.montserrat(
      fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
  subtitle1: GoogleFonts.montserrat(fontSize: 12, fontWeight: FontWeight.w300),
  bodyText1: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w500),
));

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color.fromRGBO(44, 44, 53, 1),
    secondary: Color.fromRGBO(112, 112, 124, 1),
    tertiary: Color.fromRGBO(226, 226, 234, 1),
    background: Color.fromRGBO(15, 15, 19, 1),
    inversePrimary: Color.fromRGBO(72, 7, 234, 1),
  ),
  textTheme: GoogleFonts.notoSansDisplayTextTheme(),
  dividerColor: Colors.transparent
);
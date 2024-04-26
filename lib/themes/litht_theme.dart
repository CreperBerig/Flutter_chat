import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData ligthMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Color.fromRGBO(226, 226, 234, 1),
    secondary: Color.fromRGBO(154, 154, 175, 1),
    tertiary: Color.fromRGBO(22, 22, 30, 1),
    background: Color.fromRGBO(242, 243, 247, 1),
    inversePrimary: Color.fromRGBO(0, 98, 255, 1),
  ),
  textTheme: GoogleFonts.notoSansDisplayTextTheme(),
  dividerColor: Colors.transparent
);
import 'package:flutter/material.dart';

class ThemaApp {
  static ThemeData get global {
    return ThemeData(
      backgroundColor: const Color(0xffEDE8E3),
      scaffoldBackgroundColor: const Color(0xffEDE8E3),
      textTheme: const TextTheme(
        headline2: TextStyle(
          color: Color(0xff000000),
          fontSize: 18,
          fontWeight: FontWeight.w400,
          fontFamily: 'Manrope',
        ),
        headline3: TextStyle(
          color: Color(0xff191D63),
          fontSize: 20,
          fontWeight: FontWeight.w900,
          fontFamily: 'Manrope',
        ),
        bodyText1: TextStyle(
          color: Color(0xff191D63),
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontFamily: 'Manrope',
        ),
        bodyText2: TextStyle(
          color: Color(0xff060710),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Manrope',
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff31CD63),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          minimumSize: const Size(330, 60),
        ),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Colors.white,
        shape: CircleBorder(),
        padding: EdgeInsets.all(10),
      ),
      // mudar cor do leading no appBar
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}

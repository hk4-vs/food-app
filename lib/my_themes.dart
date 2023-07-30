import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemes {
  ThemeData lightTheme() {
    return ThemeData(
        primaryColor: const Color(0xff462B9C),
        highlightColor: Colors.white,
        colorScheme: const ColorScheme.light(
            onPrimary: Color(0xffFEFEFE),
            background: Color(0xffFDFCFF),
            onBackground: Color(0xffFBFAFF),
            surface: Color(0xffEBE8E8),
            onSurface: Color(0xffEFEEEE),
            shadow: Color(0xff6F6D6D),
            secondary: Colors.black),
        textTheme: TextTheme(
            headlineMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
            headlineSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
            titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
            titleSmall: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, fontSize: 18.0),
            bodySmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: GoogleFonts.poppins(fontWeight: FontWeight.w500),
            bodyLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
            ),
            labelMedium: GoogleFonts.poppins(
                fontSize: 14, fontWeight: FontWeight.w300)));
  }

  ThemeData darkTheme() {
    return ThemeData(
        highlightColor: const Color(0xff70e000),
        primaryColor: const Color(0xff462B9C),
        colorScheme: const ColorScheme.dark(
          onPrimary: Color(0xff2C5364),
          background: Color(0xff0D1B2A),
          onBackground: Color(0xff1B263B),
          surface: Color(0xff415A77),
          onSurface: Color(0xff778DA9),
          shadow: Color(0xffE0E1DD),
          secondary: Colors.white,
        ),
        textTheme: TextTheme(
            headlineMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white),
            headlineSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
            titleMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
            titleSmall: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              // color: Colors.white,
            ),
            bodySmall: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
            bodyMedium: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              // color: Colors.white,
            ),
            bodyLarge: GoogleFonts.poppins(
              fontWeight: FontWeight.w800,
              // color: Colors.white,
            ),
            labelMedium: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              // color: Colors.white,
            )));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TempChatTextTheme {
  static TextTheme get textTheme => TextTheme(
        headlineLarge: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 36.sp,
        ),
        headlineMedium: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 32.sp,
        ),
        headlineSmall: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 24.sp,
        ),
        bodyLarge: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 18.sp,
        ),
        bodyMedium: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
        ),
        bodySmall: TextStyle(
          color: const Color(0xff060606),
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        ),
      );
}

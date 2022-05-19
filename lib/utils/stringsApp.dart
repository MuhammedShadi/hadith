import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hadith/utils/colorsApp.dart';

abstract class TextApp {
  static Text primaryText = Text(
    "الأربعون النووية",
    style: GoogleFonts.tajawal(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      color: ColorApp.whiteColor,
    ),
  );  static Text primary1Text = Text(
    "الأربعون النووية",
    style: GoogleFonts.tajawal(
      fontWeight: FontWeight.bold,
      fontSize: 36,
      color: ColorApp.primaryColor,
    ),
  );
  static Text primarySmallText = Text(
    "الأربعون النووية",
      textDirection: TextDirection.rtl,
    style: GoogleFonts.tajawal(fontSize: 16,textStyle: TextStyle(fontWeight: FontWeight.bold)),
  );
  static Text headerScreenTwoText = Text(
    "لحفظ وسماع الاحاديث النبوية",
    style: GoogleFonts.tajawal(
      fontWeight: FontWeight.bold,
      fontSize: 24,
      color: ColorApp.primaryColor,
    ),
  );
  static Text cardOne = Text(
    "الأحاديث الأربعون",
    style: GoogleFonts.tajawal(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: ColorApp.whiteColor,
    ),
  );
  static Text cardTwo = Text("الأحاديث المحفوظة",
      style: GoogleFonts.tajawal(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: ColorApp.whiteColor,
      ));
  static Text cardThree = Text(
    "الاستماع للأحاديث",
    style: GoogleFonts.tajawal(
      fontWeight: FontWeight.bold,
      fontSize:22,
      color: ColorApp.whiteColor,
    ),
  );static Text cardThree2 = Text(
    "الاستماع للأحاديث",
    style: GoogleFonts.tajawal(
      fontWeight: FontWeight.bold,
      fontSize:22,
      color: ColorApp.primaryColor,
    ),
  );
}

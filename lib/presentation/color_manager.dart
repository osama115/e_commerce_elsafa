import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class ColorManager{
  static const MaterialColor bl = const MaterialColor(0x8A000000,<int, Color>{
    50: Color(0xff000000),
    700: Color(0x8A000000)
  });

  // static const MaterialColor black54 =  MaterialColor(0x8A000000,<int, Color>{});
  static const defaultColor =Colors.blue;
  static Color black54 =Colors.black54;
  static Color blackwith =Colors.black.withOpacity(0.4);
  static Color whitewith =Colors.white.withOpacity(0.7);
  static Color primary = Color(0xffd187c3);
  static Color primary2 = Color(0xff0d2f4f);
  static Color primary3 = Color(0xff7a5774);
  static Color darkGrey =const Color(0xff525252);
  static Color grey =const Color(0xff737477);
  static Color greyPurple =const Color(0xffCCBEE3);
  static Color grey300 = Colors.grey[300]!;
  static Color lightGrey =const Color(0xff9E9E9E);
  static Color transparent =Colors.transparent;

  //new
  static Color darkPrimary =const Color(0xffd17d11);
  static WidgetStateProperty brwomBottoncolor =  WidgetStateProperty.all<Color>(Color(0xff7E463E)) as WidgetStateProperty ;
  static Color ofWhite =const Color(0xffF9F4EC) as Color;
  static const Color offwhite = Color(0xffF9F4EC);
  static const Color purple = Color(0xff745F9A);
  static const Color white1 = Color(0xffFFFFFF);
  static const Color pro = Color(0xffF9F4EC);
  static Color offfwhite = Colors.grey[300]!;
  static Color? brown =const Color(0xff7E463E);
  static const Color brownn = Color(0xff7E463E);
  // static const Color gridcolor = Color(0xff7E463E);
  static const Color? browne = Color(0xff7E463E);
  static Color lightPrimary =const Color(0xccd17d11);
  static Color pink1 =const Color(0xffd186c3);
  static Color grey1 =const Color(0xff707070);
  static Color grey2 =const Color(0xff797979);
  static Color grey30 =Colors.grey.shade300;
  static Color white =const Color(0xffFFFFFF);
  static Color red =const Color(0xffe61f34);
  static Color black =const Color(0xff000000);
  static Color blue =const Color(0xff2196F3);
  static Color a =const Color(0xffdb749f);
  static Color b =const Color(0xff7d87c2);
  static Color blue1 =Colors.blue;
  static Color yellow =Colors.yellow[700]!;
  static Color yellow8 =Colors.yellow[800]!;
  static Color green =Colors.green;
  static Color greenSh =Colors.green.shade50;
  static Color greenSh4 =Colors.green.shade400;
  static Color greenSh7 =Colors.green.shade700;



}
import 'package:flutter/material.dart';

class FontConstants {
  static const String fontFamily = "GentiumPlus";
}

class fontWeightManager {
  static const FontWeight italic = FontWeight.w600;
  static const FontWeight bolditalic = FontWeight.w700;
  static const FontWeight reguler = FontWeight.w800;
  static const FontWeight bold = FontWeight.w900;
}

class Fontsize {
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s22 = 22;
}

double theResponsiveFontSize(
    {required BuildContext context, required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.1;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 900) {
    return width / 700;
  } else {
    return width / 1000;
  }
}

TextStyle _getTextStyle(
    {required double fontsize,
    required Color color,
    required FontWeight fontWeight,
    required BuildContext context}) {
  return TextStyle(
     color: color,
    fontFamily: FontConstants.fontFamily,
    fontSize: theResponsiveFontSize(
      
      fontSize: fontsize,
      context: context,
    ),
    fontWeight: fontWeight,
  );
}

TextStyle getRegulerTextStyle({
  Color color = Colors.black,
  double fontSize = Fontsize.s16,
  required BuildContext context,
}) {
  return _getTextStyle(
      color: color,
      fontsize: fontSize,
      fontWeight: fontWeightManager.reguler,
      context: context);
}

TextStyle getItalicTextStyle({
  Color color = Colors.black,
  double fontSize = Fontsize.s18,
  required BuildContext context,
}) {
  return _getTextStyle(
      color: color,
      fontsize: fontSize,
      fontWeight: fontWeightManager.italic,
      context: context);
}

TextStyle getBoldItalicTextStyle({
  Color color = Colors.black,
  double fontSize = Fontsize.s20,
  required BuildContext context,
}) {
  return _getTextStyle(
        color: color,

      fontsize: fontSize,
      fontWeight: fontWeightManager.bolditalic,
      context: context);
}


TextStyle getBoldTextStyle({
  Color color = Colors.black,
  double fontSize = Fontsize.s20,
  required BuildContext context,
}) {
  return _getTextStyle(
    color: color,
    fontsize: fontSize,
    fontWeight: fontWeightManager.bold,
    context: context,
  );
}
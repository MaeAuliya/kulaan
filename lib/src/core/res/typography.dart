import 'package:flutter/material.dart';

class CoreTypography {
  const CoreTypography._();

  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight regular = FontWeight.w400;

  static Text coreText({
    required String text,
    Color color = Colors.black,
    FontWeight fontWeight = regular,
    double fontSize = 12,
    Color? underlineColor,
    bool isTextOverflow = false,
    int maxLine = 1,
    TextAlign textAlign = TextAlign.start,
    double? textHeight,
  }) =>
      Text(
        text,
        style: TextStyle(
          decoration: (underlineColor != null) ? TextDecoration.underline : null,
          decorationColor: underlineColor,
          decorationThickness: 2,
          fontSize: fontSize,
          color: color,
          // fontFamily: Fonts.roboto, // // Apply your default fonts here
          fontWeight: fontWeight,
          height: textHeight,
        ),
        overflow: isTextOverflow ? TextOverflow.ellipsis : null,
        maxLines: maxLine,
        textAlign: textAlign,
      );
}
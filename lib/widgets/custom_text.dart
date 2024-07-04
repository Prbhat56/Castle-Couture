import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/custom_colors.dart';

class CustomText {
  static bodyText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          double? fontSize,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: fontSize ?? 14,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? CustomColors.subHeadingColor,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static buttonText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? CustomColors.white,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static captionText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? CustomColors.primaryBlack,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static contentText({
    String? text,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
  }) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? CustomColors.primaryBlack,
          decoration: textDecoration,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static descriptionText(
          {required String text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text,
        style: const TextStyle(
          fontFamily: 'Nunito',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          height: 1.34,
        ),
      );

  static headingText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? CustomColors.primaryBlack,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static headline({
    String? text,
    Color? color,
    TextAlign? textAlign,
    int? maxLines,
    bool? softWrap,
    TextOverflow? overflow,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
  }) =>
      Text(
        text!,
        style: TextStyle(
          decoration: textDecoration ?? TextDecoration.none,
          fontSize: 17,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w600,
          color: color ?? CustomColors.primaryBlack,
          fontStyle: fontStyle ?? FontStyle.normal,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static inputText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight,
          FontStyle? fontStyle}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 14,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? CustomColors.primaryBlack,
          fontStyle: fontStyle,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static spanText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          double? fontSize,
          TextOverflow? overflow,
          TextDecoration? textDecoration,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: fontSize ?? 12,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? CustomColors.liteBlack,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );
  static subHeadingText(
          {String? text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text!,
        style: TextStyle(
          fontSize: 16,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w400,
          color: color ?? CustomColors.primaryBlack,
        ),
        textAlign: textAlign ?? TextAlign.center,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );

  static textFieldError(
          {required String text,
          Color? color,
          TextAlign? textAlign,
          int? maxLines,
          bool? softWrap,
          TextOverflow? overflow,
          FontWeight? fontWeight}) =>
      Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontFamily: GoogleFonts.nunito().fontFamily,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: color ?? CustomColors.errorColor,
        ),
        textAlign: textAlign ?? TextAlign.start,
        maxLines: maxLines,
        softWrap: softWrap ?? true,
        overflow: overflow,
      );
}
